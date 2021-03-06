<?php

namespace App\Controller;

use App\Entity\CodigoPostal;
use App\Entity\Municipio;
use App\Entity\Plantel;
use App\Form\CodigoPostalType;
use App\Form\FiltroType;
use Knp\Component\Pager\Paginator;
use Knp\Component\Pager\PaginatorInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

/**
 * @Route("/codigo/postal")
 */
class CodigoPostalController extends AbstractController
{
    /**
     * @Route("/", name="codigo_postal_index", methods={"GET","POST"})
     */
    public function index(Request $request, PaginatorInterface $paginator): Response
    {
        $form=$this->createForm(FiltroType::class,[],['action'=>$this->generateUrl('codigo_postal_index')]);
        $form->handleRequest($request);

        $dql   = "SELECT cp FROM App:CodigoPostal cp";
        $data=$request->query->get('filtro');

        if ($form->isSubmitted() || $data!="") {
            if($form->isSubmitted())
                $data = $form->getData()["filtro"];

            $dql   = "SELECT cp FROM App:CodigoPostal cp JOIN cp.municipio m JOIN m.estado e WHERE m.nombre LIKE :value OR e.nombre LIKE :value OR cp.d_Asenta LIKE :value";
            $query = $this->getDoctrine()->getManager()->createQuery($dql)->setParameter('value',"%".$data."%");
        }
        else
            $query = $this->getDoctrine()->getManager()->createQuery($dql);

        $pagination = $paginator->paginate(
            $query, /* query NOT result */
            $request->query->getInt('page', 1), /*page number*/
            10 /*limit per page*/
        );

        return $this->render('codigo_postal/index.html.twig', [
            'pagination' => $pagination,
            'filtro'=>$data,
            'form' => $form->createView(),
        ]);
    }

    /**
     * @Route("/new", name="codigo_postal_new", methods={"GET","POST"})
     */
    public function new(Request $request): Response
    {
        $codigoPostal = new CodigoPostal();
        $form = $this->createForm(CodigoPostalType::class, $codigoPostal);
        $form->handleRequest($request);

        if ($form->isSubmitted())
            if(!$request->isXmlHttpRequest())
                throw $this->createAccessDeniedException();
            else
            if ($form->isValid()) {
                $entityManager = $this->getDoctrine()->getManager();
                $entityManager->persist($codigoPostal);
                $entityManager->flush();
                $this->addFlash('success','El código postal fue registrado satisfactoriamente');
                return $this->json(['url' => $this->generateUrl('codigo_postal_index',[],1)]);
            }
            else{
                $page = $this->renderView('codigo_postal/_form.html.twig', [
                    'form' => $form->createView(),
                ]);
                return $this->json(['form' => $page, 'error' => true,]);
            }

        return $this->render('codigo_postal/new.html.twig', [
            'codigo_postal' => $codigoPostal,
            'form' => $form->createView(),
        ]);
    }

    /**
     * @Route("/{id}/show", name="codigo_postal_show", methods={"GET"})
     */
    public function show(Request $request, CodigoPostal $codigoPostal): Response
    {
        if(!$request->isXmlHttpRequest())
            throw $this->createAccessDeniedException();

        return $this->render('codigo_postal/show.html.twig', [
            'codigo_postal' => $codigoPostal,
        ]);
    }

    /**
     * @Route("/{id}/findbymunicipio", name="codigo_postal_find_by_municipio", methods={"GET"},options={"expose"=true})
     */
    public function findByMunicipio(Request $request, Municipio $municipio): Response
    {
        if (!$request->isXmlHttpRequest())
            throw $this->createAccessDeniedException();

        $em = $this->getDoctrine()->getManager();

        $codigos_postales_array=$em->getRepository(CodigoPostal::class)
                                   ->findByMunicipioJson($municipio->getId());

        return $this->json($codigos_postales_array);
    }

    /**
     * @Route("/{id}/edit", name="codigo_postal_edit", methods={"GET","POST"})
     */
    public function edit(Request $request, CodigoPostal $codigoPostal): Response
    {
        $form = $this->createForm(CodigoPostalType::class, $codigoPostal);
        $form->handleRequest($request);
        $esEliminable=$this->esEliminable($codigoPostal);
        if ($form->isSubmitted())
            if(!$request->isXmlHttpRequest())
                throw $this->createAccessDeniedException();
            else
                if ($form->isValid()) {
                    $entityManager = $this->getDoctrine()->getManager();
                    $entityManager->flush();
                    $this->addFlash('success','El código postal fue actualizado satisfactoriamente');
                    return $this->json(['url' => $this->generateUrl('codigo_postal_index',[],1)]);
                }
                else{
                    $page = $this->renderView('codigo_postal/_form.html.twig', [
                        'action'=>'Actualizar',
                        'form' => $form->createView(),
                    ]);
                    return $this->json(['form' => $page, 'error' => true,]);
                }

        return $this->render('codigo_postal/edit.html.twig', [
            'codigo_postal' => $codigoPostal,
            'action'=>'Actualizar',
            'form' => $form->createView(),
            'eliminable'=>$esEliminable
        ]);
    }

    /**
     * @Route("/{id}/delete", name="codigo_postal_delete")
     */
    public function delete(Request $request, CodigoPostal $codigoPostal): Response
    {
        if (!$request->isXmlHttpRequest() || !$this->isCsrfTokenValid('delete' . $codigoPostal->getId(), $request->query->get('_token')) || false==$this->esEliminable($codigoPostal))
            throw $this->createAccessDeniedException();

        $em = $this->getDoctrine()->getManager();
        $em->remove($codigoPostal);
        $em->flush();
        $this->addFlash('success','El código postal fue eliminado satisfactoriamente');
        return $this->json(['url'=>$this->generateUrl('codigo_postal_index')]);
    }

    private function esEliminable(CodigoPostal $codigoPostal){
        $em = $this->getDoctrine()->getManager();
        $escuela=$em->getRepository(Plantel::class)->findOneBy(['d_codigo'=>$codigoPostal]);
        return  $escuela==null;
    }
}

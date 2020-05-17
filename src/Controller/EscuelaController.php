<?php


namespace App\Controller;

use App\Entity\Escuela;
use App\Entity\Estatus;
use App\Entity\Proyecto;
use App\Form\EscuelaType;
use App\Form\FiltroType;
use Doctrine\Persistence\ManagerRegistry;
use Knp\Bundle\SnappyBundle\Snappy\Response\SnappyResponse;
use Knp\Component\Pager\PaginatorInterface;
use Knp\Snappy\Pdf;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

ini_set('memory_limit', '-1');

/**
 * @Route("/escuela")
 */
class EscuelaController extends AbstractController
{
    /**
     * @Route("/", name="escuela_index", methods={"GET","POST"})
     */
    public function index(Request $request, PaginatorInterface $paginator): Response
    {
        $form=$this->createForm(FiltroType::class,[],['action'=>$this->generateUrl('escuela_index')]);
        $form->handleRequest($request);

        $dql   = "SELECT e FROM App:Escuela e";
        $data=$request->query->get('filtro');

        if ($form->isSubmitted() || $data!="") {
            if($form->isSubmitted())
                $data = $form->getData()["filtro"];

            $dql   = "SELECT e FROM App:Escuela e WHERE e.escuela LIKE :value OR e.ccts LIKE :value";
            $query = $this->getDoctrine()->getManager()->createQuery($dql)->setParameter('value',"%".$data."%");
        }
        else
            $query = $this->getDoctrine()->getManager()->createQuery($dql);

        $escuelas = $paginator->paginate(
            $query, /* query NOT result */
            $request->query->getInt('page', 1), /*page number*/
            $this->getParameter('knp_num_items_per_page') /*limit per page*/
        );

        return $this->render('escuela/index.html.twig', [
            'escuelas' => $escuelas,
            'filtro'=>$data,
            'form' => $form->createView(),
        ]);
    }

    /**
     * @Route("/new", name="escuela_new", methods={"GET","POST"},options={"expose"=true})
     */
    public function new(Request $request): Response
    {
        if (!$request->isXmlHttpRequest())
            throw $this->createAccessDeniedException();

        $escuela = new Escuela();
        $form = $this->createForm(EscuelaType::class, $escuela, ['action' => $this->generateUrl('escuela_new')]);
        $form->handleRequest($request);

        if ($form->isSubmitted())
            if ($form->isValid()) {
                $entityManager = $this->getDoctrine()->getManager();
                $entityManager->persist($escuela);
                $entityManager->flush();
                $this->addFlash('success','La escuela fue registrada satisfactoriamente');
                return $this->json([
                    'url'=>$this->generateUrl('escuela_index')
                ]);
            } else {
                $page = $this->renderView('escuela/_form.html.twig', [
                    'escuela'=>$escuela,
                    'form' => $form->createView(),
                ]);
                return $this->json(['form' => $page, 'error' => true,]);
            }

        return $this->render('escuela/new.html.twig', [
            'escuela' => $escuela,
            'form' => $form->createView(),
        ]);
    }

    /**
     * @Route("/{id}/show", name="escuela_show", methods={"GET"},options={"expose"=true})
     */
    public function show(Escuela $escuela): Response
    {
        return $this->render('escuela/details.html.twig',[
            'escuela'=>$escuela
        ]);
    }

    /**
     * @Route("/{id}/exportar", name="escuela_exportar", methods={"GET"})
     */
    public function exportar(Escuela $escuela, Pdf $snappy): Response
    {
        $proyectos = $this->getDoctrine()->getRepository(Proyecto::class)->findByEscuela($escuela);
        $html=$this->renderView('escuela/pdf.html.twig',[
            'escuela'=>$escuela,
            'proyectos'=>$proyectos
        ]);

        return new Response(
            $snappy->getOutputFromHtml($html),
            200,
            [
                'Content-Type' => 'application/pdf',
                'Content-Disposition' => sprintf('attachment; filename="%s"', "detalles_escuela.pdf"),
            ]
        );
    }

    /**
     * @Route("/{id}/edit", name="escuela_edit", methods={"GET","POST"},options={"expose"=true})
     */
    public function edit(Request $request, Escuela $escuela): Response
    {
        if (!$request->isXmlHttpRequest())
            throw $this->createAccessDeniedException();

        $form = $this->createForm(EscuelaType::class, $escuela, ['action' => $this->generateUrl('escuela_edit', ['id' => $escuela->getId()])]);
        $form->handleRequest($request);

        if ($form->isSubmitted())
            if ($form->isValid()) {
                $em = $this->getDoctrine()->getManager();
                $em->persist($escuela);
                $em->flush();
                $this->addFlash('success','La escuela fue actualizada satisfactoriamente');
                return $this->json([
                    'url'=>$this->generateUrl('escuela_index')
                ]);
            } else {
                $page = $this->renderView('escuela/_form.html.twig', [
                    'escuela' => $escuela,
                    'form' => $form->createView(),
                    'form_id' => 'escuela_edit',
                    'action' => 'Actualizar',
                ]);
                return $this->json(['form' => $page, 'error' => true]);
            }

        return $this->render('escuela/new.html.twig', [
            'escuela' => $escuela,
            'title' => 'Editar escuela',
            'action' => 'Actualizar',
            'form_id' => 'escuela_edit',
            'form' => $form->createView(),
        ]);
    }

    /**
     * @Route("/{id}", name="escuela_delete")
     */
    public function delete(Request $request, Escuela $escuela): Response
    {
        if (!$request->isXmlHttpRequest() || !$this->isCsrfTokenValid('delete' . $escuela->getId(), $request->query->get('_token')))
            throw $this->createAccessDeniedException();

        $em = $this->getDoctrine()->getManager();
        $estatus=$this->getDoctrine()->getRepository(Estatus::class)->findOneByEstatus('Eliminado');
        if(!$estatus)
            throw new \Exception('No existe el estatus');
        $escuela->setEstatus($estatus);
        $em->flush();
        $this->addFlash('success','La escuela fue eliminada satisfactoriamente');
        return $this->json([
            'url'=>$this->generateUrl('escuela_index')
        ]);
    }

}

<?php

namespace App\Form;

use App\Entity\Escuela;
use App\Entity\Proyecto;
use App\Entity\RendicionCuentas;
use App\Form\Transformer\DatetoStringTransformer;
use Doctrine\ORM\EntityRepository;
use Symfony\Bridge\Doctrine\Form\Type\EntityType;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\Extension\Core\Type\FileType;
use Symfony\Component\Form\Extension\Core\Type\NumberType;
use Symfony\Component\Form\Extension\Core\Type\TextType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;

class RendicionCuentasType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options)
    {
        $escuela = $options['escuela'];
        $required=!$options['data']->getId() ? true : false;
        $builder
            ->add('fechacaptura',TextType::class,['label'=>'Fecha de captura','attr'=>['class'=>'form-control', 'pattern'=>'\d{4}-\d{2}-\d{2}','autocomplete' => 'off']])
            ->add('monto',NumberType::class,['attr'=>['class'=>'form-control','autocomplete'=>'off']])
            ->add('tipoAccion',null,['label'=>'Tipo de acción'])
            ->add('file', FileType::class, array('label'=>' ','required' => $required))
        ;
        $builder->get('fechacaptura')->addModelTransformer(new DatetoStringTransformer());

        $builder->add('proyecto', EntityType::class, array(
            'class' => Proyecto::class,
            'required'=>true,
            'query_builder' => function (EntityRepository $repository) use ($escuela) {
                $qb = $repository->createQueryBuilder('proyecto')
                    ->innerJoin('proyecto.escuela', 'p');
                if ($escuela instanceof Escuela) {
                    $qb->where('p.id = :id')
                        ->setParameter('id', $escuela);
                } elseif (is_numeric($escuela)) {
                    $qb->where('p.id = :id')
                        ->setParameter('id', $escuela);
                } else {
                    $qb->where('p.id = :id')
                        ->setParameter('id', null);
                }
                return $qb;
            }

        , 'attr' => array('class' => 'form-control input-medium')));
    }

    public function configureOptions(OptionsResolver $resolver)
    {
        $resolver->setDefaults([
            'data_class' => RendicionCuentas::class,
        ]);
        $resolver->setRequired(['escuela']);
    }
}

<?php

namespace App\Form;

use App\Entity\TipoComprobante;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;

class TipoComprobanteType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options)
    {
        $builder
            ->add('comprobante')
            ->add('descripcion')
            ->add('fechacaptura')
            ->add('estatus')
        ;
    }

    public function configureOptions(OptionsResolver $resolver)
    {
        $resolver->setDefaults([
            'data_class' => TipoComprobante::class,
        ]);
    }
}

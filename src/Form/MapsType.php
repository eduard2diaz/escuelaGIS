<?php

namespace App\Form;

use App\Entity\Estado;
use App\Form\Subscriber\AddEscuelaEstadoFieldSubscriber;
use Symfony\Bridge\Doctrine\Form\Type\EntityType;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\Extension\Core\Type\TextType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;

class MapsType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options)
    {
        $builder
            ->add('estado',EntityType::class,['class'=>Estado::class])
            ->add('escuela', TextType::class, ['required'=>false,'attr' => ['class' => 'form-control','autocomplete'=>'off']])
        ;
    }

    public function configureOptions(OptionsResolver $resolver)
    {
        $resolver->setDefaults([
            // Configure your form options here
        ]);
    }
}
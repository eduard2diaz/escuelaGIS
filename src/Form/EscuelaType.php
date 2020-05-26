<?php

namespace App\Form;

use App\Entity\Escuela;
use App\Form\Subscriber\AddCodigoPostalMunicipioFieldSubscriber;
use App\Form\Subscriber\AddMunicipioEstadoFieldSubscriber;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\Extension\Core\Type\TextType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;

class EscuelaType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options)
    {
        $builder
            ->add('escuela',TextType::class,['attr'=>['class'=>'form-control','autocomplete'=>'off']])
            ->add('ccts',TextType::class,['label'=>'Clave del Centro de Trabajo del Plantel','attr'=>['class'=>'form-control','autocomplete'=>'off']])
            ->add('estado',null,['required'=>true,'placeholder'=>'Seleccione un estado'])
            ->add('tipoasentamiento',null,['label'=>'Tipo de Asentamiento','placeholder'=>'Seleccione un tipo de asentamiento'])
            ->add('asentamiento',TextType::class,['required'=>false,'attr'=>['class'=>'form-control','autocomplete'=>'off']])
            ->add('calle',TextType::class,['required'=>false,'attr'=>['class'=>'form-control','autocomplete'=>'off']])
            ->add('noexterior',TextType::class,['required'=>false,'label'=>'Número Exterior','attr'=>['class'=>'form-control','autocomplete'=>'off']])
        ;


        $factory = $builder->getFormFactory();
        $builder->addEventSubscriber(new AddMunicipioEstadoFieldSubscriber($factory));
        $builder->addEventSubscriber(new AddCodigoPostalMunicipioFieldSubscriber($factory));
    }

    public function configureOptions(OptionsResolver $resolver)
    {
        $resolver->setDefaults([
            'data_class' => Escuela::class,
        ]);
    }
}

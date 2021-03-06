<?php

namespace App\Entity;

use Doctrine\ORM\Mapping as ORM;
use Symfony\Component\Validator\Constraints as Assert;
use App\Validator\Proyecto as ProyectoConstraint;
use Symfony\Component\Validator\Context\ExecutionContextInterface;


/**
 * @ORM\Entity(repositoryClass="App\Repository\ProyectoRepository")
 * @ProyectoConstraint
 */
class Proyecto
{
    /**
     * @ORM\Id()
     * @ORM\GeneratedValue(strategy="AUTO")
     * @ORM\Column(type="integer")
     */
    private $id;

    /**
     * @ORM\ManyToOne(targetEntity="App\Entity\Plantel")
     * @ORM\JoinColumn(nullable=false)
     */
    private $plantel;

    /**
     * @ORM\Column(type="date")
     */
    private $fechainicio;

    /**
     * @ORM\Column(type="date",nullable=true)
     */
    private $fechafin;

    /**
     * @ORM\Column(type="float")
     * @Assert\Range(
     *      min = 0,
     * )
     */
    private $montoasignado;

    /**
     * @ORM\Column(type="string", length=10)
     * @Assert\Length(
     *      max = 10,
     *      maxMessage = "El número del proyecto no puede exceder los {{ limit }} caracteres",
     *)
     */
    private $numero;

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getFechainicio(): ?\DateTimeInterface
    {
        return $this->fechainicio;
    }

    public function setFechainicio(\DateTimeInterface $fechainicio): self
    {
        $this->fechainicio = $fechainicio;

        return $this;
    }

    public function getFechafin(): ?\DateTimeInterface
    {
        return $this->fechafin;
    }

    public function setFechafin(?\DateTimeInterface $fechafin): self
    {
        $this->fechafin = $fechafin;

        return $this;
    }

    public function getMontoasignado(): ?float
    {
        return $this->montoasignado;
    }

    public function setMontoasignado(float $montoasignado): self
    {
        $this->montoasignado = $montoasignado;

        return $this;
    }

    public function __toString()
    {
        return $this->getNumero();
    }

    public function getNumero(): ?string
    {
        return $this->numero;
    }

    public function setNumero(string $numero): self
    {
        $this->numero = $numero;

        return $this;
    }

    /**
     * @return mixed
     */
    public function getPlantel()
    {
        return $this->plantel;
    }

    /**
     * @param mixed $plantel
     */
    public function setPlantel($plantel): void
    {
        $this->plantel = $plantel;
    }

    /**
     * @Assert\Callback
     */
    public function validate(ExecutionContextInterface $context)
    {
        if (null==$this->getPlantel())
            $context->addViolation('Seleccione un plantel.');
        if($this->getFechafin()!=null && $this->getFechainicio()>$this->getFechafin())
            $context->addViolation('Compruebe las fechas de inicio y fin.');
    }


}

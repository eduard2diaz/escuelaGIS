<?php

namespace App\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * @ORM\Entity(repositoryClass="App\Repository\TipoAccionRepository")
 */
class TipoAccion
{
    /**
     * @ORM\Id()
     * @ORM\GeneratedValue()
     * @ORM\Column(type="integer")
     */
    private $id;

    /**
     * @ORM\Column(type="string", length=255)
     */
    private $accion;

    /**
     * @ORM\Column(type="text")
     */
    private $descripcion;

    /**
     * @ORM\Column(type="date")
     */
    private $fechacaptura;

    /**
     * @ORM\ManyToOne(targetEntity="App\Entity\Estatus")
     * @ORM\JoinColumn(nullable=false)
     */
    private $estatus;

    public function __construct()
    {
        $this->setFechacaptura(new \DateTime());
    }

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getAccion(): ?string
    {
        return $this->accion;
    }

    public function setAccion(string $accion): self
    {
        $this->accion = $accion;

        return $this;
    }

    public function getDescripcion(): ?string
    {
        return $this->descripcion;
    }

    public function setDescripcion(string $descripcion): self
    {
        $this->descripcion = $descripcion;

        return $this;
    }

    public function getFechacaptura(): ?\DateTimeInterface
    {
        return $this->fechacaptura;
    }

    public function setFechacaptura(\DateTimeInterface $fechacaptura): self
    {
        $this->fechacaptura = $fechacaptura;

        return $this;
    }

    public function getEstatus(): ?Estatus
    {
        return $this->estatus;
    }

    public function setEstatus(?Estatus $estatus): self
    {
        $this->estatus = $estatus;

        return $this;
    }
}
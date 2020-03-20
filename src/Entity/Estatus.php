<?php

namespace App\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * @ORM\Entity(repositoryClass="App\Repository\EstatusRepository")
 */
class Estatus
{
    /**
     * @ORM\Id()
     * @ORM\GeneratedValue()
     * @ORM\Column(type="integer")
     */
    private $id;

    /**
     * @ORM\Column(type="string", length=250)
     */
    private $estatus;

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getEstatus(): ?string
    {
        return $this->estatus;
    }

    public function setEstatus(string $estatus): self
    {
        $this->estatus = $estatus;

        return $this;
    }

    public function __toString()
    {
        return $this->getEstatus();
    }
}
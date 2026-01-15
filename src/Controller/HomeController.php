<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use App\Repository\CategoriesRepository;


class HomeController extends AbstractController
{
    /**
     * @Route("/", name="home")
     */
    public function home(CategoriesRepository $catRepo): Response
    {
        return $this->render('home/index.html.twig', ['categories' => $catRepo->findAll()]);
    }  

}

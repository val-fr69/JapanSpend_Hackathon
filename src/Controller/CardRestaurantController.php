<?php

namespace App\Controller;

class CardRestaurantController extends AbstractController
{
    /**
     * List items
     */
    public function index(): string
    {

        return $this->twig->render('cards/cardRestaurant.html.twig');
    }
}

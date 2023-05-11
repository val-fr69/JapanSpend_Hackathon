<?php

namespace App\Controller;

use App\Model\CityManager;
use App\Model\RestaurantManager;

class HomeController extends AbstractController
{
    public function showRestaurant(): string
    {
        $restaurantManager = new RestaurantManager();
        $restaurant = $restaurantManager->selectAll();

        return $this->twig->render('Home/index.html.twig', ['restaurants' => $restaurant]);
    }

    public function home(): string
    {
        $restaurantManager = new RestaurantManager();
        $restaurant = $restaurantManager->selectAll();

        return $this->twig->render('Home/home.html.twig');
    }
}

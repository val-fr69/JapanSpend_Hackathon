<?php

namespace App\Controller;

use App\Model\TransportManager;
use App\Model\RestaurantManager;
use App\Model\ActivityManager;

class HomeController extends AbstractController
{
    public function index(): string
    {
        $restaurantManager = new RestaurantManager();
        $restaurant = $restaurantManager->selectAll();

        $activityManager = new ActivityManager();
        $activity = $activityManager->selectAll();
        
        $transportManager = new transportManager();
        $transport = $transportManager->selectAll();

        return $this->twig->render(
            'Home/index.html.twig',
            ['restaurants' => $restaurant,
            'activities' => $activity,
            'transports' => $transport,
            ]
        );
    }

    public function home(): string
    {
        return $this->twig->render('Home/home.html.twig');
    }
}

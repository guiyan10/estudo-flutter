<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use App\Models\Category;

class CategorySeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $categories = [
            [
                'name' => 'Eletrônicos',
                'description' => 'Produtos eletrônicos e gadgets',
                'image' => 'categories/electronics.jpg',
            ],
            [
                'name' => 'Roupas',
                'description' => 'Vestuário e acessórios',
                'image' => 'categories/clothing.jpg',
            ],
            [
                'name' => 'Casa e Jardim',
                'description' => 'Produtos para casa e jardim',
                'image' => 'categories/home.jpg',
            ],
            [
                'name' => 'Esportes',
                'description' => 'Equipamentos e roupas esportivas',
                'image' => 'categories/sports.jpg',
            ],
            [
                'name' => 'Livros',
                'description' => 'Livros e literatura',
                'image' => 'categories/books.jpg',
            ],
            [
                'name' => 'Beleza',
                'description' => 'Produtos de beleza e cosméticos',
                'image' => 'categories/beauty.jpg',
            ],
        ];

        foreach ($categories as $category) {
            Category::create($category);
        }
    }
}

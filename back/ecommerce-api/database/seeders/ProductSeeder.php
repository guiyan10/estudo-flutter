<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use App\Models\Product;
use App\Models\Category;

class ProductSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $products = [
            // Eletrônicos
            [
                'name' => 'Smartphone Galaxy S23',
                'description' => 'Smartphone Samsung Galaxy S23 com 128GB, câmera de 50MP e bateria de 3900mAh',
                'price' => 2999.99,
                'image' => 'products/smartphone.jpg',
                'stock' => 50,
                'category_id' => 1,
                'is_featured' => true,
                'rating' => 4.5,
                'reviews_count' => 120,
            ],
            [
                'name' => 'Notebook Dell Inspiron',
                'description' => 'Notebook Dell Inspiron 15" com Intel i5, 8GB RAM, 256GB SSD',
                'price' => 3499.99,
                'image' => 'products/notebook.jpg',
                'stock' => 25,
                'category_id' => 1,
                'is_featured' => true,
                'rating' => 4.3,
                'reviews_count' => 85,
            ],
            [
                'name' => 'Fones de Ouvido Bluetooth',
                'description' => 'Fones de ouvido sem fio com cancelamento de ruído ativo',
                'price' => 299.99,
                'image' => 'products/headphones.jpg',
                'stock' => 100,
                'category_id' => 1,
                'is_featured' => false,
                'rating' => 4.2,
                'reviews_count' => 200,
            ],
            
            // Roupas
            [
                'name' => 'Camiseta Básica',
                'description' => 'Camiseta 100% algodão, disponível em várias cores',
                'price' => 49.99,
                'image' => 'products/tshirt.jpg',
                'stock' => 200,
                'category_id' => 2,
                'is_featured' => false,
                'rating' => 4.0,
                'reviews_count' => 150,
            ],
            [
                'name' => 'Calça Jeans',
                'description' => 'Calça jeans masculina, modelo slim fit',
                'price' => 129.99,
                'image' => 'products/jeans.jpg',
                'stock' => 75,
                'category_id' => 2,
                'is_featured' => false,
                'rating' => 4.1,
                'reviews_count' => 90,
            ],
            
            // Casa e Jardim
            [
                'name' => 'Panela de Pressão',
                'description' => 'Panela de pressão 5L, inox 18/10, com válvula de segurança',
                'price' => 189.99,
                'image' => 'products/pressure-cooker.jpg',
                'stock' => 30,
                'category_id' => 3,
                'is_featured' => true,
                'rating' => 4.7,
                'reviews_count' => 65,
            ],
            [
                'name' => 'Vaso Decorativo',
                'description' => 'Vaso de cerâmica decorativo, ideal para plantas',
                'price' => 79.99,
                'image' => 'products/vase.jpg',
                'stock' => 60,
                'category_id' => 3,
                'is_featured' => false,
                'rating' => 4.4,
                'reviews_count' => 45,
            ],
            
            // Esportes
            [
                'name' => 'Tênis Esportivo',
                'description' => 'Tênis para corrida, com amortecimento e respirabilidade',
                'price' => 199.99,
                'image' => 'products/sneakers.jpg',
                'stock' => 80,
                'category_id' => 4,
                'is_featured' => true,
                'rating' => 4.6,
                'reviews_count' => 110,
            ],
            [
                'name' => 'Bola de Futebol',
                'description' => 'Bola de futebol oficial, tamanho 5, material sintético',
                'price' => 89.99,
                'image' => 'products/soccer-ball.jpg',
                'stock' => 120,
                'category_id' => 4,
                'is_featured' => false,
                'rating' => 4.3,
                'reviews_count' => 75,
            ],
            
            // Livros
            [
                'name' => 'O Senhor dos Anéis',
                'description' => 'Trilogia completa de O Senhor dos Anéis, edição especial',
                'price' => 89.99,
                'image' => 'products/lotr.jpg',
                'stock' => 40,
                'category_id' => 5,
                'is_featured' => false,
                'rating' => 4.8,
                'reviews_count' => 300,
            ],
            
            // Beleza
            [
                'name' => 'Kit de Maquiagem',
                'description' => 'Kit completo de maquiagem com 12 cores de sombra',
                'price' => 159.99,
                'image' => 'products/makeup-kit.jpg',
                'stock' => 90,
                'category_id' => 6,
                'is_featured' => false,
                'rating' => 4.2,
                'reviews_count' => 180,
            ],
        ];

        foreach ($products as $product) {
            Product::create($product);
        }
    }
}

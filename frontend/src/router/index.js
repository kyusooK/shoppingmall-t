import { createRouter, createWebHashHistory } from 'vue-router';

const router = createRouter({
  history: createWebHashHistory(),
  routes: [
    {
      path: '/',
      component: () => import('../components/pages/Index.vue'),
    },
    {
      path: '/orders',
      component: () => import('../components/ui/OrderGrid.vue'),
    },
    {
      path: '/deliveries',
      component: () => import('../components/ui/DeliveryGrid.vue'),
    },
    {
      path: '/products',
      component: () => import('../components/ui/ProductGrid.vue'),
    },
  ],
})

export default router;

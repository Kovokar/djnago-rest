from django.urls import path, include
from .views import CursoAPIView, AvaliacaoAPIView
from rest_framework.routers import DefaultRouter

# urlpatterns = [
#     path('cursos/', CursoAPIView.as_view(), name='cursos-list'),  # Endpoint para listagem de cursos
#     path('cursos/create/', CursoAPIView.as_view(), name='cursos-create'),  # Endpoint para criação de curso
#     path('avaliacoes/', AvaliacaoAPIView.as_view(), name='avaliacoes-list'),  # Endpoint para listagem de avaliações
# ]


router = DefaultRouter()
router.register(r'cursos', CursoAPIView)
router.register(r'avaliacoes', AvaliacaoAPIView)

urlpatterns = [
    path('', include(router.urls)),
]

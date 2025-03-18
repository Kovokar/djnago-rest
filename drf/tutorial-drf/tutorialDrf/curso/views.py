from rest_framework import viewsets
from rest_framework.decorators import action
from .models import Curso, Avaliacao
from .serializers import CursoSerializer, AvaliacaoSerializer
from rest_framework.response import Response


class CursoAPIView(viewsets.ModelViewSet):
    queryset = Curso.objects.all()
    serializer_class = CursoSerializer

    @action(detail=False, methods=['get'], url_path='curso-mais-avaliado')
    def curso_mais_avaliado(self, request):
        # Exemplo de lógica personalizada para pegar o curso mais avaliado
        curso = Curso.objects.order_by('-avaliacoes__avaliacao').first()  # Exemplo de lógica
        print(curso)
        serializer = self.get_serializer(curso)
        # serializer = self.get_serializer(curso)
        return Response(serializer.data)

    
class AvaliacaoAPIView(viewsets.ModelViewSet):
    queryset = Avaliacao.objects.all()
    serializer_class = AvaliacaoSerializer


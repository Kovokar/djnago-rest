from rest_framework import serializers
from .models import *


class CursoSerializer(serializers.ModelSerializer):
    class Meta:
        model = Curso
        fields = '__all__'

class AvaliacaoSerializer(serializers.ModelSerializer):
    class Meta:
        extra_kwargs = { "email": {"write_only": True}}
        model = Avaliacao
        fields = '__all__' 

from django.contrib import admin
from .models import Curso, Avaliacao

#modo preguiça
# @admin.register(Curso)
# class CursoAdmin(admin.ModelAdmin):
#     list_display = [field.name for field in Curso._meta.fields]

@admin.register(Curso)
class CursoAdmin(admin.ModelAdmin):
    list_display = ('titulo', 'url', 'dt_create', 'dt_update', 'ativo')

@admin.register(Avaliacao)
class AvaliacaoAdmin(admin.ModelAdmin):
    list_display = ('curso', 'nome', 'email', 'avaliacao', 'dt_create', 'dt_update', 'ativo')

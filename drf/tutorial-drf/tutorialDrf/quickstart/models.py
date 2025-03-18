from django.db import models

class Livro(models.Model):
    titulo = models.CharField(max_length=200)
    autor = models.CharField(max_length=100)
    data_publicacao = models.DateField()
    preco = models.DecimalField(max_digits=6, decimal_places=2)
    sinopse = models.TextField()

    def __str__(self):
        return self.titulo

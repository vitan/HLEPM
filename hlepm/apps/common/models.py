from django.db import models


class DictBase(models.Model):
    """ An abstract model for dict table such as: status, ack,version, and so on"""

    name = models.CharField(max_length=150)
    order = models.PositiveIntegerField()

    class Meta:
        abstract = True

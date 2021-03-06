# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('bel', '0001_initial'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='house',
            name='address',
        ),
        migrations.AddField(
            model_name='house',
            name='fuid',
            field=models.IntegerField(default=0),
            preserve_default=False,
        ),
        migrations.AddField(
            model_name='house',
            name='postcode',
            field=models.CharField(max_length=100, null=True, blank=True),
        ),
        migrations.AddField(
            model_name='house',
            name='vraagprijs',
            field=models.CharField(max_length=100, null=True, blank=True),
        ),
    ]

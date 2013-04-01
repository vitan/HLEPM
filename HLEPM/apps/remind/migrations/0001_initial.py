# -*- coding: utf-8 -*-
import datetime
from south.db import db
from south.v2 import SchemaMigration
from django.db import models


class Migration(SchemaMigration):

    def forwards(self, orm):
        # Adding model 'EmailPurpose'
        db.create_table('HLEPM_email_purpose', (
            ('id', self.gf('django.db.models.fields.AutoField')(primary_key=True)),
            ('purpose', self.gf('django.db.models.fields.CharField')(max_length=100)),
        ))
        db.send_create_signal('remind', ['EmailPurpose'])

        # Adding model 'EmailTemplates'
        db.create_table('HLEPM_email_config', (
            ('id', self.gf('django.db.models.fields.AutoField')(primary_key=True)),
            ('subject', self.gf('django.db.models.fields.CharField')(max_length=100)),
            ('mail_to', self.gf('django.db.models.fields.CharField')(max_length=100)),
            ('message', self.gf('django.db.models.fields.TextField')()),
            ('purpose', self.gf('django.db.models.fields.related.ForeignKey')(to=orm['remind.EmailPurpose'])),
            ('created_on', self.gf('django.db.models.fields.DateTimeField')(auto_now_add=True, blank=True)),
            ('updated_on', self.gf('django.db.models.fields.DateTimeField')(auto_now=True, blank=True)),
            ('enabled', self.gf('django.db.models.fields.BooleanField')(default=False)),
        ))
        db.send_create_signal('remind', ['EmailTemplates'])


    def backwards(self, orm):
        # Deleting model 'EmailPurpose'
        db.delete_table('HLEPM_email_purpose')

        # Deleting model 'EmailTemplates'
        db.delete_table('HLEPM_email_config')


    models = {
        'remind.emailpurpose': {
            'Meta': {'object_name': 'EmailPurpose', 'db_table': "'HLEPM_email_purpose'"},
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'purpose': ('django.db.models.fields.CharField', [], {'max_length': '100'})
        },
        'remind.emailtemplates': {
            'Meta': {'object_name': 'EmailTemplates', 'db_table': "'HLEPM_email_config'"},
            'created_on': ('django.db.models.fields.DateTimeField', [], {'auto_now_add': 'True', 'blank': 'True'}),
            'enabled': ('django.db.models.fields.BooleanField', [], {'default': 'False'}),
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'mail_to': ('django.db.models.fields.CharField', [], {'max_length': '100'}),
            'message': ('django.db.models.fields.TextField', [], {}),
            'purpose': ('django.db.models.fields.related.ForeignKey', [], {'to': "orm['remind.EmailPurpose']"}),
            'subject': ('django.db.models.fields.CharField', [], {'max_length': '100'}),
            'updated_on': ('django.db.models.fields.DateTimeField', [], {'auto_now': 'True', 'blank': 'True'})
        }
    }

    complete_apps = ['remind']
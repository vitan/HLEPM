from django import forms
from django.utils.translation import ugettext_lazy as _
from django.contrib.contenttypes.models import ContentType
from HLEPM.apps.attachments.models import Attachment

class AttachmentForm(forms.ModelForm):
    attachment_file = forms.FileField(label=_('Upload attachment'))

    class Meta:
        model = Attachment
        fields = ('attachment_file',)

    def save(self, request, obj, *args, **kwargs):
        self.instance.creator = request.user
        self.instance.content_type = ContentType.objects.get_for_model(obj)
        self.instance.object_id = obj.id
        super(AttachmentForm, self).save(*args, **kwargs)

    def update(self, request, obj, *args, **kwargs):
        type = ContentType.objects.get_for_model(obj)
        id = obj.id

        query_set = Attachment.objects.filter(content_type=type, object_id=id)
        query_set.update(is_removed=True)

        self.instance.creator = request.user
        self.instance.content_type = type
        self.instance.object_id = id
        super(AttachmentForm, self).save(*args, **kwargs)

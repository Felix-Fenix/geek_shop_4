from django.urls import re_path

import authnapp.views as authnapp
from authnapp.apps import AuthnappConfig

app_name = AuthnappConfig.name

urlpatterns = [
    re_path(r"^login/$", authnapp.login, name="login"),
    re_path(r"^logout/$", authnapp.logout, name="logout"),
    re_path(r"^register/$", authnapp.register, name="register"),
    re_path(r"^edit/$", authnapp.edit, name="edit"),
    re_path(r"^verify/(?P<email>.+)/(?P<activation_key>\w+)/$", authnapp.verify, name="verify"),
    re_path(r"^verify_send_message/$", authnapp.verify_send_message, name="verify_send_message"),
    re_path(r"^verify_send_message_fail/$", authnapp.verify_send_message_fail, name="verify_send_message_fail"),

]

from os import environ
from pybuilder.core import task, init
from ddadevops import *
from subprocess import run

name = 'meissa'
MODULE = 'repos'
PROJECT_ROOT_PATH = '../../..'


class MyBuild(DigitaloceanBackendPropertiesMixin):
    pass


@init
def initialize(project):
    project.build_depends_on('ddadevops>=3.0.2')
    stage = environ['STAGE']
    do_api_key = gopass_password_from_path(
        environ.get('DIGITALOCEAN_TOKEN_KEY_PATH', None))
    do_s3_id = gopass_field_from_path('server/devops/digitalocean/s3', 'id')
    do_s3_secret = gopass_field_from_path(
        'server/devops/digitalocean/s3', 'secret')
    repo_meissa_token_ro = gopass_password_from_path('server/meissa/repo/buero-ro')
    codeberg_gitea_token = gopass_password_from_path('server/meissa/codeberg')
    github_token = gopass_password_from_path('server/meissa/github')
    gitlab_token = gopass_password_from_path('server/meissa/gitlab')

    config = create_digitalocean_terraform_build_config(stage,
                                                        PROJECT_ROOT_PATH,
                                                        MODULE,
                                                        {'repo_meissa_token_ro': repo_meissa_token_ro,
                                                         'codeberg_gitea_token': codeberg_gitea_token,
                                                         'github_token': github_token,
                                                         'gitlab_token': gitlab_token},
                                                        do_api_key,
                                                        do_s3_id,
                                                        do_s3_secret,
                                                        use_workspace=False,
                                                        terraform_semantic_version="1.0.8")
    config = add_digitalocean_backend_properties_mixin_config(config,
                                                              stage,
                                                              'fra1.digitaloceanspaces.com',
                                                              'meissa-configuration-2',
                                                              MODULE)
    build = MyBuild(project, config)
    build.initialize_build_dir()
    run('cp -r mirror ' + build.build_path(), shell=True, check=False)


@task
def plan(project):
    build = get_devops_build(project)
    build.plan()


@task
def apply(project):
    build = get_devops_build(project)
    build.apply(True)


@task
def destroy(project):
    build = get_devops_build(project)
    build.destroy(True)

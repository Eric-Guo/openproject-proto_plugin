import type { Ng2StateDeclaration } from '@uirouter/angular';
import { KittenPageComponent } from 'core-app/features/plugins/linked/openproject-th_plugin/kitten-page/kitten-page.component';
import { ThProjectMembersPageComponent } from 'core-app/features/plugins/linked/openproject-th_plugin/th-project-members-page/th-project-members-page.component';

export const KITTEN_ROUTES:Ng2StateDeclaration[] = [
  {
    name: 'th_members',
    parent: 'optional_project',
    url: '/th_members',
    component: ThProjectMembersPageComponent,
  },
  {
    name: 'kittens',
    url: '/angular_kittens',
    component: KittenPageComponent,
  },
];
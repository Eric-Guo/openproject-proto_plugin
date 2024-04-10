import type { Ng2StateDeclaration } from '@uirouter/angular';
import { ThProjectMembersPageComponent } from 'core-app/features/plugins/linked/openproject-th_plugin/th-project-members/th-project-members-page.component';

export const KITTEN_ROUTES:Ng2StateDeclaration[] = [
  {
    name: 'th_members',
    parent: 'optional_project',
    url: '/th_members',
    component: ThProjectMembersPageComponent,
  }
];
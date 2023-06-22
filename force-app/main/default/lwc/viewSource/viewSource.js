import { LightningElement } from 'lwc';

export default class ViewSource extends LightningElement {
    baseURL="https://github.com/trailheadapps/lwc-recipes/tree/main/force-app/main/default/lwc/apexImperativeMethodWithParams";
get sourceUrl() {
    return this.baseURL;
}
}
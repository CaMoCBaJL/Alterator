function createObject(pathToObject, parent, params) {
    let comp = Qt.createComponent(pathToObject);

    if (comp.status === Component.Ready){
        comp.createObject(parent, params);
    } else {
        console.log(comp.errorString());
    }
}

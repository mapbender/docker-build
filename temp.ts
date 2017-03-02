/**
 * Created by atd on 02.03.17.
 */



interface Dict {
    [name: string]: boolean;
    [key: number]: [number, string, number];
}

let a: Dict = {};


a['test'] = true;
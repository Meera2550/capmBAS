namespace myfirst.demo;

using{cuid,managed} from '@sap/cds/common';

entity employee : cuid ,managed{
    //key id :String(30);
    Name      : String(30);
    eamil_id  : String(255);
    dept      : String(30);
}

entity Department:cuid{
    Name : String(255);
}
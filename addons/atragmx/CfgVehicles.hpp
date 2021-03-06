class CfgVehicles {
    class Man;
    class CAManBase: Man {
        class ACE_SelfActions {
            class ACE_Equipment {
                class GVAR(open) {
                    displayName = "$STR_ACE_ATragMX_OpenATragMXDialog";
                    condition = QUOTE(call FUNC(can_show));
                    statement = QUOTE(call FUNC(create_dialog));
                    showDisabled = 0;
                    priority = 2;
                    icon = PATHTOF(UI\ATRAG_Icon.paa);
                    exceptions[] = {"notOnMap", "isNotInside"};
                };
            };
        };
    };

    class Item_Base_F;
    class ACE_Item_ATragMX: Item_Base_F {
        author = "Ruthberg";
        scope = 2;
        scopeCurator = 2;
        displayName = "ATragMX";
        vehicleClass = "Items";
        class TransportItems {
            class ACE_ATragMX {
                name = "ACE_ATragMX";
                count = 1;
            };
        };
    };

    class Box_NATO_Support_F;
    class ACE_Box_Misc: Box_NATO_Support_F {
        class TransportItems {
            MACRO_ADDITEM(ACE_ATragMX,6);
        };
    };
};

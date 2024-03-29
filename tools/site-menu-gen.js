const {reorderMenuIds, outSql} = require("./utils");
var sql = `
USE \`ry_vue_extend\`;
DELETE
FROM sys_menu
WHERE menu_id >= 3000;

DELETE
FROM sys_menu
WHERE menu_id=4;

`;

(async function (arg) {
    await reorderMenuIds()
    let menuData = require('toml').parse(require('fs').readFileSync('./menu/menu.toml'));
    genSql(menuData);
    await outSql(sql);
}("get started"));

function genSql(menuData, M_order_num = 0, parentId = 0) {
    for (let key1 in menuData) {
        M_order_num += 10;
        var M = menuData[key1];
        if (typeof M == "object") {
            M.path = `${M.path}`;
            sql += firstMenu(M, M_order_num, key1, parentId);
        }

        var C_order_nume = 0;
        if (typeof M == "object") {
            for (const key2 in M) {
                let C = M[key2];
                if (C.type == 'm') {
                    C.path = M.path + '/' + C.path;
                    var tmp = {[key2]: C};
                    genSql(tmp, 0, M.menuId);
                } else {
                    if (typeof C == "object") {
                        C_order_nume += 1;
                        sql += secondaryMenu(C, C_order_nume, M, key2);
                        for (let key3 in C) {
                            let buttons = C[key3];
                            if (typeof buttons == "object") {
                                var F_order_num = 0;
                                for (let fkey in buttons) {
                                    F_order_num += 1;
                                    let F = buttons[fkey];
                                    sql += buttonMenu(F, F_order_num, fkey, C, M, key2)
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}

/**
 *  -- 一级菜单
 */

function firstMenu(M, M_order_num, firstMenuKey, parentId = '0') {
    let path = M.path;
    if (M.type === 'm') {
        path = path.substr(path.indexOf('/') + 1, path.length);
    }

    return `
        INSERT INTO sys_menu
        VALUES ('${M.menuId}', '${firstMenuKey}', '${parentId}', '${M_order_num}', '${path}', '', NULL, 1, 0, 'M', '0',
                '0', '', '${M.icon}', 'admin', SYSDATE(), '', NULL, '${firstMenuKey}-目录');
    `;
}

/**
 * -- 二级菜单
 */
function secondaryMenu(C, C_order_nume, M, key2) {
    let perms = `${M.path}:${C.path}:list`.replace(/\//g, ':');
    return `
        INSERT INTO sys_menu
        VALUES ('${C.menuId}', '${key2}', '${M.menuId}', '${C_order_nume}', '${C.path}', '${M.path}/${C.path}/index',
                '', 1, 0, 'C', '0', '0', '${perms}', '${C.icon}', 'admin', SYSDATE(), '', NULL, '${key2}-菜单');
    `;
}

/**
 * -- 管理按钮
 */
function buttonMenu(F, F_order_num, key, C, M, pageName) {
    let perms = `${M.path}:${C.path}:${F.perms}`.replace(/\//g, ':');
    return `
        INSERT INTO sys_menu
        VALUES ('${F.menuId}', '${key}', '${C.menuId}', '${F_order_num}', '', '', '', 1, 0, 'F', '0', '0', '${perms}',
                '#', 'admin', SYSDATE(), '', NULL, '${pageName}-${key}-按钮');
    `;
}



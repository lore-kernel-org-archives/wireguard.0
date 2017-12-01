Return-Path: germano.massullo@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7aa78f35
 for <wireguard@lists.zx2c4.com>; Fri, 1 Dec 2017 17:06:35 +0000 (UTC)
Received: from mail-wr0-f170.google.com (mail-wr0-f170.google.com
 [209.85.128.170])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1ba016f6
 for <wireguard@lists.zx2c4.com>; Fri, 1 Dec 2017 17:06:35 +0000 (UTC)
Received: by mail-wr0-f170.google.com with SMTP id o2so10836317wro.5
 for <wireguard@lists.zx2c4.com>; Fri, 01 Dec 2017 09:12:52 -0800 (PST)
Return-Path: <germano.massullo@gmail.com>
To: joe@solidadmin.com, WireGuard mailing list <wireguard@lists.zx2c4.com>
From: Germano Massullo <germano.massullo@gmail.com>
Subject: Wireguard ceased to work after Fedora 26->27 upgrade
Message-ID: <b984758b-93ce-f909-e63e-f31fb575a5f9@gmail.com>
Date: Fri, 1 Dec 2017 18:12:43 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hi there, some days ago I upgraded my system from Fedora 26 to 27, and
Wireguard ceased to work.


# systemctl status wg-quick@wg0.service
=E2=97=8F wg-quick@wg0.service - WireGuard via wg-quick(8) for wg0
=C2=A0=C2=A0 Loaded: loaded (/usr/lib/systemd/system/wg-quick@.service; e=
nabled;
vendor preset: disabled)
=C2=A0=C2=A0 Active: failed (Result: exit-code) since Fri 2017-12-01 17:5=
5:43 CET;
2min 18s ago
=C2=A0=C2=A0=C2=A0=C2=A0 Docs: man:wg-quick(8)
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 man:wg(8)
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 https://www.=
wireguard.com/
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 https://www.=
wireguard.com/quickstart/
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 https://git.=
zx2c4.com/WireGuard/about/src/tools/wg-quick.8
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 https://git.=
zx2c4.com/WireGuard/about/src/tools/wg.8
=C2=A0 Process: 907 ExecStart=3D/usr/bin/wg-quick up wg0 (code=3Dexited,
status=3D1/FAILURE)
=C2=A0Main PID: 907 (code=3Dexited, status=3D1/FAILURE)

dic 01 17:55:43 machine systemd[1]: Starting WireGuard via wg-quick(8)
for wg0...
dic 01 17:55:43 machine wg-quick[907]: [#] ip link add wg0 type wireguard=

dic 01 17:55:43 machine wg-quick[907]: RTNETLINK answers: Operation not
supported
dic 01 17:55:43 machine wg-quick[907]: Unable to get device: Protocol
not supported
dic 01 17:55:43 machine systemd[1]: wg-quick@wg0.service: Main process
exited, code=3Dexited, status=3D1/FAILURE
dic 01 17:55:43 machine systemd[1]: Failed to start WireGuard via
wg-quick(8) for wg0.
dic 01 17:55:43 machine systemd[1]: wg-quick@wg0.service: Unit entered
failed state.
dic 01 17:55:43 machine systemd[1]: wg-quick@wg0.service: Failed with
result 'exit-code'.


# dnf list installed | grep wireguard
wireguard-dkms.noarch=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 1:0.0.20171127-1.fc27=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0
@jdoss-wireguard=C2=A0
wireguard-tools.x86_64=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 1:0.0.20171127-1.fc27=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=

@jdoss-wireguard

# dkms status
returns nothing

kernel packages:
kernel-4.13.16-300.fc27.x86_64
kernel-core-4.13.16-300.fc27.x86_64
kernel-devel-4.13.16-300.fc27.x86_64
kernel-headers-4.13.16-300.fc27.x86_64


Do you have any idea?
Thank you!

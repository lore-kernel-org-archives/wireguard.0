Return-Path: ilovezfs@icloud.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1d631aba
 for <wireguard@lists.zx2c4.com>; Mon, 2 Oct 2017 05:58:24 +0000 (UTC)
Received: from pv33p04im-asmtp001.me.com (pv33p04im-asmtp001.me.com
 [17.143.181.10])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id cce649a7
 for <wireguard@lists.zx2c4.com>; Mon, 2 Oct 2017 05:58:24 +0000 (UTC)
Received: from process-dkim-sign-daemon.pv33p04im-asmtp001.me.com by
 pv33p04im-asmtp001.me.com
 (Oracle Communications Messaging Server 8.0.1.2.20170607 64bit (built Jun  7
 2017)) id <0OX600H00MZMJW00@pv33p04im-asmtp001.me.com> for
 wireguard@lists.zx2c4.com; Mon, 02 Oct 2017 06:27:08 +0000 (GMT)
Received: from localhost (pv33p04im-webms004.me.com [17.142.224.168])
 by pv33p04im-asmtp001.me.com
 (Oracle Communications Messaging Server 8.0.1.2.20170607 64bit (built Jun  7
 2017)) with ESMTP id <0OX600MZDN978X00@pv33p04im-asmtp001.me.com> for
 wireguard@lists.zx2c4.com; Mon, 02 Oct 2017 06:27:07 +0000 (GMT)
To: wireguard@lists.zx2c4.com
From: ilove zfs <ilovezfs@icloud.com>
Subject: Build failure on macOS for wireguard tools 0.0.20171001
Date: Mon, 02 Oct 2017 06:27:07 +0000 (GMT)
Message-id: <f220e737-a703-433e-8761-8db3584bb7d8@me.com>
Content-type: multipart/alternative;
 boundary=Apple-Webmail-42--d5a6d806-1cbb-472d-ad94-e39d8cfa4e4f
MIME-version: 1.0
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>


--Apple-Webmail-42--d5a6d806-1cbb-472d-ad94-e39d8cfa4e4f
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
    charset=utf-8;
    format=flowed

MNL_SOCKET_BUFFER_SIZE is not defined on macOS since libmnl.h is for Linux=
 only but =C2=A00.0.20171001 still attempts to use it, leading to build fa=
ilure=0A=0A=0A=0AA full build log is here: https://gist.github.com/ilovezf=
s/ae19ee8af5b64bc1e89b453b2283b53f=0A=0A=0A=0AThe error is "ipc.c:891:45: =
error: use of undeclared identifier 'MNL_SOCKET_BUFFER_SIZE'"=0A=0A=0ARef:=
 https://github.com/Homebrew/homebrew-core/pull/18822=0A=0A=0A=0A=0A
--Apple-Webmail-42--d5a6d806-1cbb-472d-ad94-e39d8cfa4e4f
Content-Type: multipart/related;
    type="text/html";
    boundary=Apple-Webmail-86--d5a6d806-1cbb-472d-ad94-e39d8cfa4e4f


--Apple-Webmail-86--d5a6d806-1cbb-472d-ad94-e39d8cfa4e4f
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
    charset=utf-8;

<html><body><div>MNL_SOCKET_BUFFER_SIZE is not defined on macOS since libmnl.h is for =
Linux only but &nbsp;0.0.20171001 still attempts to use it, leading to bui=
ld failure<br></div><div><br data-mce-bogus=3D"1"></div><div>A full build =
log is here: https://gist.github.com/ilovezfs/ae19ee8af5b64bc1e89b453b2283=
b53f<br data-mce-bogus=3D"1"></div><div><br data-mce-bogus=3D"1"></div><di=
v>The error is "ipc.c:891:45: error: use of undeclared identifier 'MNL_SOC=
KET_BUFFER_SIZE'"</div><div><br data-mce-bogus=3D"1"></div><div>Ref: https=
://github.com/Homebrew/homebrew-core/pull/18822<br data-mce-bogus=3D"1"></=
div><div><br></div><div><br data-mce-bogus=3D"1"></div></body></html>
--Apple-Webmail-86--d5a6d806-1cbb-472d-ad94-e39d8cfa4e4f--

--Apple-Webmail-42--d5a6d806-1cbb-472d-ad94-e39d8cfa4e4f--

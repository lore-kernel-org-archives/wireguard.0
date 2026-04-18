Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55F6BF99C89
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 18 Apr 2026 16:24:14 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 07e8297f;
	Sat, 18 Apr 2026 16:24:12 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org
 [2600:3c0a:e001:78e:0:1991:8:25])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id cca072bd
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sat, 18 Apr 2026 16:24:09 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 5F489401C0
 for <wireguard@lists.zx2c4.com>; Sat, 18 Apr 2026 16:24:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EFA3DC19424
 for <wireguard@lists.zx2c4.com>; Sat, 18 Apr 2026 16:24:06 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="ShW/Os8C"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1776529444;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=XzUouJFi6KXIATE3m+IFRsv0k0n/p/Uiz5fnxKgQ0kU=;
 b=ShW/Os8CYb6AllxrvLU86WXKkMe5m2g44MNVYFb2nyeIdDibW/1+bSWSBkRULhxWwX4EMF
 7PUPMfPyVxqDLslBhiOWGME/s65olz9hgy7Mu7nkuUzarlFF+L8uWfPc+kodUtl59oIAXP
 OEE8dl+QWmX5xoh3bUUl0IZDikt1SXw=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 3e1832c8
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sat, 18 Apr 2026 16:24:04 +0000 (UTC)
Received: by mail-oa1-f46.google.com with SMTP id
 586e51a60fabf-4243bf9be36so806488fac.3
 for <wireguard@lists.zx2c4.com>; Sat, 18 Apr 2026 09:24:04 -0700 (PDT)
X-Gm-Message-State: AOJu0Yw9IztjGgHRPQMEerAyTn7Ei4UfFPr47kjLb1kvL8ggKri7EiYE
 jixZq1xHQWkWxM5A4QhgBP9n+jQM65Eo9by9ZucEbgqL7htfD/XMNaQWks4BmB2G53I7SRc8x0i
 SEKc9zn3pxY2iUa75G/8/KbDLtyVs+OE=
X-Received: by 2002:a05:6870:788d:b0:417:3cc0:8dc9 with SMTP id
 586e51a60fabf-42aded1cc8cmr4041090fac.24.1776529443268; Sat, 18 Apr 2026
 09:24:03 -0700 (PDT)
MIME-Version: 1.0
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Sat, 18 Apr 2026 18:23:52 +0200
X-Gmail-Original-Message-ID: <CAHmME9pDd2JMcEuSgOKpXPhUB8FSO+rNJdTkXRzpLhK1_xW9Cg@mail.gmail.com>
X-Gm-Features: AQROBzB_s-g3Yi7kwBcPIdUbuHJCKdzvsRzUBzG54NFrdVS_75iovQPbQhc8Bg0
Message-ID: <CAHmME9pDd2JMcEuSgOKpXPhUB8FSO+rNJdTkXRzpLhK1_xW9Cg@mail.gmail.com>
Subject: [ANNOUNCE] WireGuard for Windows and WireGuardNT, Version 1.0
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.30rc1
Precedence: list
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

Hey again,

I=E2=80=99m happy to announce the v1.0 release of WireGuardNT and WireGuard
for Windows. The final =E2=80=9C1.0 blockers=E2=80=9D have been completed a=
t last, and
I=E2=80=99m quite happy to have reached this milestone. It should now be
available from the built-in updater. And you can download it fresh
from:

- https://download.wireguard.com/windows-client/wireguard-installer.exe
- https://www.wireguard.com/install/

And to learn more about each of these two Windows projects:
- https://git.zx2c4.com/wireguard-windows/about/
- https://git.zx2c4.com/wireguard-nt/about/

Before I say more, I wanted to note that the WireGuard Project runs on
support from large companies and individuals alike. You can help out
at: https://www.wireguard.com/donations/ . If your company uses
WireGuard, consider talking to your employer about becoming a large
donor and appearing on that page. If you use a VPN from a VPN
provider, consider writing to them to suggest they donate to the
project. It does make a difference and is the reason the project is
able to live on.

The 1.0 release of WireGuardNT is a pile of bug fixes, after having
done a big read through of the source code and countless hours of new
testing. But it also has two big improvements, which have long been
considered release blockers for me.

Firstly, 1.0 now makes use of
NdisWdfGetAdapterContextFromAdapterHandle(). WireGuard=E2=80=99s IOCTL work=
s
by piggybacking on the NDIS device node, so that it inherits NDIS=E2=80=99
setup and permissions. Each IOCTL is thus passed through the device=E2=80=
=99s
=E2=80=9Cfunctional device object=E2=80=9D. There=E2=80=99s no documented f=
unction to go from
a pointer in the functional device object to the WireGuard-specific
state allocated. The functional device object=E2=80=99s DeviceExtension fie=
ld
points to the NDIS_MINIPORT_BLOCK structure, which itself has a
pointer to the WireGuard-specific state. But that latter pointer is at
a potentially unstable offset, as it=E2=80=99s not within the documented pa=
rt
of NDIS_MINIPORT_BLOCK. So, previously, I was using the =E2=80=9CReserved=
=E2=80=9D
member of the functional device object to stuff a pointer in, but who
knows when that was to be used by something, a ticking time bomb.
Fortunately, every Windows 10 version since the first one has the
NdisWdfGetAdapterContextFromAdapterHandle() function, originally added
for NetAdapterCx, which means it=E2=80=99s not going away any time soon and
its behavior won=E2=80=99t change. This function simply goes to the right
offset in NDIS_MINIPORT_BLOCK where the driver-specific state is
stored. Put together, we get this handy function:

static WG_DEVICE *
WgDeviceFromFdo(_In_ DEVICE_OBJECT *DeviceObject)
{
    if (DeviceObject->DeviceType !=3D FILE_DEVICE_PHYSICAL_NETCARD ||
!DeviceObject->DeviceExtension)
        return NULL;
    return NdisWdfGetAdapterContextFromAdapterHandle(DeviceObject->DeviceEx=
tension);
}

This seems to work well and will hopefully ensure reliability into the futu=
re.

The second big 1.0 blocker that=E2=80=99s been solved is proper MTU change
notifications. As you may or may not know, WireGuard pads packets to
the nearest 16 bytes, but only up to the MTU of the interface, in
order to protect against traffic analysis attacks. This means the
WireGuard driver needs to know its own MTU. On Linux, we have full
access to this information, as its considered a property of the
network interface itself, so we can extract it trivially with
`skb->dev->mtu`, and do various calculations. But on Windows, the MTU
is a combined property of the network adapter=E2=80=99s minimum and maximum=
,
the tcp/ip interface=E2=80=99s selected MTU, which splits into v4 and v6
cases, and the same split cases for the tcp/ip interface=E2=80=99s
subinterfaces. This is sort of complicated, but I guess it fit a
device model that at one point made sense. The driver is responsible
for controlling the adapter=E2=80=99s minimum and maximum MTU. PowerShell=
=E2=80=99s
Set-NetIpInterface will change the interface-level MTU (via
SetIpInterfaceEntry()), while netsh.exe will change the
subinterface-level MTU; both of these wind up affecting the other in
subtle ways, and the net result is the same.

Typically, the normal way of getting notifications about these
changes, from userspace or from kernel space, is with
NotifyIpInterfaceChange(), which calls a callback function with
MibParameterNotification when something has changed. But, the callback
never fires for MTU changes! That=E2=80=99s the only one missing. The struc=
t
the callback receives has a field for the MTU, but still, it=E2=80=99s neve=
r
fired. Somebody on the relevant team at Microsoft told me in 2021,
=E2=80=9Cthis is a plain oversight and should be fixed,=E2=80=9D and somebo=
dy else
mentioned backporting the fix to the 2019 release. But for whatever
reason, this never happened, and now it=E2=80=99s 2026. In the interim peri=
od,
I had a really horrific, but still stable, workaround: I started a
thread, and every 3 seconds I called GetIpInterfaceEntry() on the LUID
of every running WireGuard adapter. You heard that right=E2=80=A6 I just
polled with a sleep. Gross dot net. But it was the only documented way
of doing this! At the same time, I wrote a little program I could run
on each new release of Windows to see at which point they fixed the
bug, so that I could adjust the version check to avoid the poll loop
on old versions.

Unfortunately, the bug never got fixed. But I didn=E2=80=99t quite feel
comfortable shipping a 1.0 with such a distasteful workaround. So I
get to work=E2=80=A6 All userspace updates to the MTU go through a file cal=
led
\Device\Nsi. The NSI driver is then responsible for dispatching this
out to the various interfaces, and also keeping current with the
various changes in the various interfaces. After attaching to
\Device\Nsi using the standard NT filter-style pattern with
IoAttachDeviceToDeviceStack(), I then intercept the
IOCTL_NSI_SET_ALL_PARAMETERS message that I reverse engineered,
looking at the NSI_SET_ALL_PARAMETERS struct, matching on object types
NlInterfaceObject and NlSubInterfaceObject, and reading out the NlMTU
parameter from NSI_IP_INTERFACE_RW and NSI_IP_SUBINTERFACE_RW. The
parts of these structures we care about seem extremely stable. It
appears to work well, and now the WireGuard driver can adapt to new
MTU changes instantly, rather than within 3 seconds. And there=E2=80=99s no
ugly polling loop. You can peruse this code in driver/nsi.c and
driver/undocumented.h if you=E2=80=99re curious.

That=E2=80=99s a lot of work =E2=80=93 it=E2=80=99s a whole separate .c fil=
e in the repo =E2=80=93 for
just getting access to one value. But that=E2=80=99s how things go, and it=
=E2=80=99s
information that simply must be had in order to implement WireGuard
properly.

Finally, there are a bunch of other little changes and fixes and now
we compile in C23 mode, so we have access to the typeof() keyword. We
also in theory could move to using alignas(n) instead of
__declspec(align(n)), but C standard alignas() doesn=E2=80=99t work on type=
s,
only members of structs and on variables, which makes it sort of
uglier to use. If you want a struct to always be aligned, then you put
the alignas(n) on the first member. I find this awkward, so we=E2=80=99re
sticking with __declspec(align(n)), which also seems pretty close to
gcc=E2=80=99s __attribute__((aligned(n))) (which is how Linux defines its
__aligned(n) macro).

On the WireGuard for Windows front =E2=80=93 WireGuardNT, just discussed, i=
s
the bundled driver component of that =E2=80=93 there are 42 bug and
correctness fixes of various varieties. And then there=E2=80=99s one nice
improvement for older versions of Windows 10. Windows 10 1809 added
support for SetInterfaceDnsSettings(), for setting the system DNS
server programatically. Before that, the only documented way was to
shell out to netsh.exe, which is what we did. It was pretty ugly, and
the way of doing that involved some really gnarly parsing.
Fortunately, newer Windows doesn=E2=80=99t need to do this. But it occurred=
 to
me =E2=80=93 since these older versions of Windows are essentially complete=
, I
can just reverse engineer what netsh.exe is doing under the hood, and
then do that myself, and not worry about that ever changing, since
that=E2=80=99s only a fallback path used for these old Windows versions. It
turns out to be pretty easy =E2=80=93 set two variables in a normal part of
the registry and send ControlService(SERVICE_CONTROL_PARAMCHANGE) to
the Dnscache service. Easy peasy.

Anyway, please let me know how it goes and if you encounter any issues.

Jason

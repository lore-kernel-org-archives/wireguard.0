Return-Path: <SRS0=FNV9=G3=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD424C433DB
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 24 Jan 2021 16:30:50 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1F0D0206BE
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 24 Jan 2021 16:30:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1F0D0206BE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=prosimo.io
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 783c2c3f;
	Sun, 24 Jan 2021 16:24:22 +0000 (UTC)
Received: from mail-qt1-x82f.google.com (mail-qt1-x82f.google.com
 [2607:f8b0:4864:20::82f])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 8f430ed7
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 21 Jan 2021 18:39:02 +0000 (UTC)
Received: by mail-qt1-x82f.google.com with SMTP id z9so2285706qtv.6
 for <wireguard@lists.zx2c4.com>; Thu, 21 Jan 2021 10:39:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=prosimo-io.20150623.gappssmtp.com; s=20150623;
 h=mime-version:from:date:message-id:subject:to
 :content-transfer-encoding;
 bh=EAFb+NmINGrzy6a8QmT9a2+MI3UqvG1NiTph7AIte2E=;
 b=OfD1dKy3Lc4sfku0FlMY+bO/PMWPm+qNrJO26qGvJnOWrO4p+iN9GXRX5/v0EDxaNi
 Di+pU/rC/axDHVX8O0kxyEwZL/Ubwq0JTukMviKOHV1u4XtwAgUDSTshvBW3BMNSAiE8
 7zSNmfU5XNDJA+ztICUa90qHRNq5x0XXipG6Ec48OSZSgDYJZUirdn4oiFDXmzftFCAn
 HmpYOGuyIyrTlXLCaIz6x7fs0xSss5csLcbNFCeuCQr+GXQAKyMTqMWmvoIBWuC1ONpD
 C9wdheZMKYXCK6d2Ca3jOe/swyQWq2eswtMLX6CTPtwpz7ShvYELcmupiqTSSQk9Mojx
 Uenw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to
 :content-transfer-encoding;
 bh=EAFb+NmINGrzy6a8QmT9a2+MI3UqvG1NiTph7AIte2E=;
 b=MuNi+Mk7KscgZLI83Dt0vleMY22G3OnGDtJppe+TfA2AcKnZH0FEWwYmfSC8ebZX3x
 B49VDBBvyViPBje/XwPc1R9+vuSTWvxsYYsbN8t1IfCIs97G3EzqkGE8qmHHCLEzZ/uK
 cL+RAqasWWKxg7rxiwXYYIAPSKQL46GRKuIBjjh9W62uXcLhI58GIPkIty3sdlKlr8Zq
 gyvA8fzdcDJM0EDrRuNNU7E3APaA70qNNsthU96xbRsgruE/gAGs3L14kpcclIYXBbRB
 jj+rgmNzqv1TW57HdpT2B3WVVe2j0kVLegESpCkSGjYPyOHAymmYktbfoYpF6tic13qC
 EqvQ==
X-Gm-Message-State: AOAM533r9sQRjzCB3n3APiE2HAr6SiVkiiW+13twc29QGRfQOx9qXM04
 1unOksYlnNRNklSAne2wvbsgZi9Z05PuuELn2+003IY3YXwDrUAx
X-Google-Smtp-Source: ABdhPJw+IRyYGfxJk4gZfJ/4kB2/O94ZJiexU1/6bpKfIAnp9lAoYkOT4ZdQX/V8rMEXBbGo3mWL3TfGnHIltlpXTBs=
X-Received: by 2002:ac8:dc5:: with SMTP id t5mr991980qti.246.1611254340970;
 Thu, 21 Jan 2021 10:39:00 -0800 (PST)
MIME-Version: 1.0
From: Manikandan Thiagarajan <tmani@prosimo.io>
Date: Thu, 21 Jan 2021 10:38:50 -0800
Message-ID: <CAJV1VRBLdBwD=bud-M7LmcFUiHfHdNa3iNbBFzJzj+4GNpPSRQ@mail.gmail.com>
Subject: Windows Tunnl.dll fails to start as a service.
To: wireguard@lists.zx2c4.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Sun, 24 Jan 2021 16:24:12 +0000
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

I am working on a project where I create Wireguard tunnels on demand
and tear down the tunnel whenever it is not needed anymore. I have
been using the tunnel.dll and start/stop the tunnel service from
another windows service. Almost always the service doesn=E2=80=99t start in
one try. So I have to keep trying in a loop until the service finally
starts.

My main() function looks like below
if (argc > 2 && !wcscmp(argv[1], L"/service"))
{
      WireGuardTunnelService(argv[2]);
      return 0;
}
Create service call
hService =3D CreateService(
            hServiceManager,
            m_serviceName.c_str(),
            m_serviceName.c_str(),
            SC_MANAGER_ALL_ACCESS,
            SERVICE_WIN32_OWN_PROCESS,
            SERVICE_DEMAND_START,
            SERVICE_ERROR_NORMAL,
            path.c_str(),
            NULL,
            NULL,
            depends, // =E2=80=9CNsi=E2=80=9D
            NULL,
            NULL);
I use windows Services API such as CreateService(). StartService(),
and QueryServiceStatusEx() to start the tunnel service. I start a
thread that monitors the service state changes after creating and
starting the service the thread restarts the service when it fails to
start. The service state changes from SERVICE_START_PENDING to
SERVICE_STOPPED when it fails to start.

Wintun Driver Version: 0.8
Wireguard version 0.1.1

Windows Event viewer Logs:
Log Name:      System
Source:        Service Control Manager
Date:          1/21/2021 9:41:23 AM
Event ID:      7034
Task Category: None
Level:         Error
Keywords:      Classic
User:          N/A
Computer:      MANI-WIN10-TEST
Description:
The ProsimoTunnel_if_cbc2a056dfdc25f7 service terminated unexpectedly.
It has done this 2 time(s).
Event Xml:
<Event xmlns=3D"http://schemas.microsoft.com/win/2004/08/events/event">
  <System>
    <Provider Name=3D"Service Control Manager"
Guid=3D"{555908d1-a6d7-4695-8e1e-26931d2012f4}" EventSourceName=3D"Service
Control Manager" />
    <EventID Qualifiers=3D"49152">7034</EventID>
    <Version>0</Version>
    <Level>2</Level>
    <Task>0</Task>
    <Opcode>0</Opcode>
    <Keywords>0x8080000000000000</Keywords>
    <TimeCreated SystemTime=3D"2021-01-21T17:41:23.8109732Z" />
    <EventRecordID>35946</EventRecordID>
    <Correlation />
    <Execution ProcessID=3D"660" ThreadID=3D"6064" />
    <Channel>System</Channel>
    <Computer>MANI-WIN10-TEST</Computer>
    <Security />
  </System>
  <EventData>
    <Data Name=3D"param1">ProsimoTunnel_if_cbc2a056dfdc25f7</Data>
    <Data Name=3D"param2">2</Data>
    <Binary>500072006F00730069006D006F00540075006E006E0065006C005F006900660=
05F0063006200630032006100300035003600640066006400630032003500660037000000</=
Binary>
  </EventData>
</Event>

Log Name:      System
Source:        Service Control Manager
Date:          1/21/2021 9:41:25 AM
Event ID:      7024
Task Category: None
Level:         Error
Keywords:      Classic
User:          N/A
Computer:      MANI-WIN10-TEST
Description:
The ProsimoTunnel_if_cbc2a056dfdc25f7 service terminated with the
following service-specific error:
The system cannot find the path specified.
Event Xml:
<Event xmlns=3D"http://schemas.microsoft.com/win/2004/08/events/event">
  <System>
    <Provider Name=3D"Service Control Manager"
Guid=3D"{555908d1-a6d7-4695-8e1e-26931d2012f4}" EventSourceName=3D"Service
Control Manager" />
    <EventID Qualifiers=3D"49152">7024</EventID>
    <Version>0</Version>
    <Level>2</Level>
    <Task>0</Task>
    <Opcode>0</Opcode>
    <Keywords>0x8080000000000000</Keywords>
    <TimeCreated SystemTime=3D"2021-01-21T17:41:25.8331194Z" />
    <EventRecordID>35950</EventRecordID>
    <Correlation />
    <Execution ProcessID=3D"660" ThreadID=3D"1540" />
    <Channel>System</Channel>
    <Computer>MANI-WIN10-TEST</Computer>
    <Security />
  </System>
  <EventData>
    <Data Name=3D"param1">ProsimoTunnel_if_cbc2a056dfdc25f7</Data>
    <Data Name=3D"param2">%%3</Data>
    <Binary>500072006F00730069006D006F00540075006E006E0065006C005F006900660=
05F0063006200630032006100300035003600640066006400630032003500660037000000</=
Binary>
  </EventData>
</Event>

Wireguard Logs:
2021-01-21 10:04:20.107655: [TUN] [if_1ea7d00c23a616b1] Starting
WireGuard/0.1.1 (Windows 10.0.19041; amd64)
2021-01-21 10:04:20.108582: [TUN] [if_1ea7d00c23a616b1] Watching
network interfaces
2021-01-21 10:04:20.111915: [TUN] [if_1ea7d00c23a616b1] Resolving DNS names
2021-01-21 10:04:20.181831: [TUN] [if_1ea7d00c23a616b1] Creating
Wintun interface
2021-01-21 10:04:20.896480: [TUN] [if_1ea7d00c23a616b1] Using
Wintun/0.8 (NDIS 6.83)
2021-01-21 10:04:20.909065: [TUN] [if_1ea7d00c23a616b1] Enabling firewall r=
ules
2021-01-21 10:04:22.126556: [TUN] [if_1ea7d00c23a616b1] Starting
WireGuard/0.1.1 (Windows 10.0.19041; amd64)
2021-01-21 10:04:22.127580: [TUN] [if_1ea7d00c23a616b1] Watching
network interfaces
2021-01-21 10:04:22.128604: [TUN] [if_1ea7d00c23a616b1] Resolving DNS names
2021-01-21 10:04:22.135234: [TUN] [if_1ea7d00c23a616b1] Creating
Wintun interface
2021-01-21 10:04:24.156638: [TUN] [if_1ea7d00c23a616b1] Starting
WireGuard/0.1.1 (Windows 10.0.19041; amd64)
2021-01-21 10:04:24.159365: [TUN] [if_1ea7d00c23a616b1] Watching
network interfaces
2021-01-21 10:04:24.159365: [TUN] [if_1ea7d00c23a616b1] Resolving DNS names
2021-01-21 10:04:24.165375: [TUN] [if_1ea7d00c23a616b1] Creating
Wintun interface
2021-01-21 10:04:24.616820: [TUN] [if_1ea7d00c23a616b1] Unable to
create Wintun interface: Error registering rings: Error listing NDIS
interfaces: no interfaces found
2021-01-21 10:04:24.634348: [TUN] [if_1ea7d00c23a616b1] Shutting down
2021-01-21 10:04:26.180594: [TUN] [if_1ea7d00c23a616b1] Starting
WireGuard/0.1.1 (Windows 10.0.19041; amd64)
2021-01-21 10:04:26.181124: [TUN] [if_1ea7d00c23a616b1] Watching
network interfaces
2021-01-21 10:04:26.182501: [TUN] [if_1ea7d00c23a616b1] Resolving DNS names
2021-01-21 10:04:26.247809: [TUN] [if_1ea7d00c23a616b1] Creating
Wintun interface
2021-01-21 10:04:27.594789: [TUN] [if_1ea7d00c23a616b1] Using
Wintun/0.8 (NDIS 6.83)
2021-01-21 10:04:27.697064: [TUN] [if_1ea7d00c23a616b1] Enabling firewall r=
ules
2021-01-21 10:04:27.439705: [TUN] [if_1ea7d00c23a616b1] Dropping privileges
2021-01-21 10:04:27.554834: [TUN] [if_1ea7d00c23a616b1] Creating
interface instance
2021-01-21 10:04:27.668048: [TUN] [if_1ea7d00c23a616b1] Routine: event
worker - started
2021-01-21 10:04:28.840433: [TUN] [if_1ea7d00c23a616b1] Routine:
encryption worker - started
2021-01-21 10:04:29.390799: [TUN] [if_1ea7d00c23a616b1] Routine:
decryption worker - started
2021-01-21 10:04:29.695953: [TUN] [if_1ea7d00c23a616b1] Routine:
handshake worker - started
2021-01-21 10:04:29.116133: [TUN] [if_1ea7d00c23a616b1] Routine: TUN
reader - started
2021-01-21 10:04:29.188358: [TUN] [if_1ea7d00c23a616b1] Setting
interface configuration
2021-01-21 10:04:29.204949: [TUN] [if_1ea7d00c23a616b1] UAPI: Updating
private key
2021-01-21 10:04:29.216665: [TUN] [if_1ea7d00c23a616b1] UAPI: Removing all =
peers
2021-01-21 10:04:29.237024: [TUN] [if_1ea7d00c23a616b1] UAPI:
Transition to peer configuration
2021-01-21 10:04:29.239373: [TUN] [if_1ea7d00c23a616b1]
peer(m6bQ.RKxw) - UAPI: Created
2021-01-21 10:04:29.240579: [TUN] [if_1ea7d00c23a616b1]
peer(m6bQ.RKxw) - UAPI: Updating endpoint
2021-01-21 10:04:29.242548: [TUN] [if_1ea7d00c23a616b1]
peer(m6bQ.RKxw) - UAPI: Updating persistent keepalive interval
2021-01-21 10:04:29.243066: [TUN] [if_1ea7d00c23a616b1]
peer(m6bQ.RKxw) - UAPI: Removing all allowedips
2021-01-21 10:04:29.248889: [TUN] [if_1ea7d00c23a616b1]
peer(m6bQ.RKxw) - UAPI: Adding allowedip
2021-01-21 10:04:29.253095: [TUN] [if_1ea7d00c23a616b1] Bringing peers up
2021-01-21 10:04:29.256190: [TUN] [if_1ea7d00c23a616b1] Routine:
receive incoming IPv6 - started
2021-01-21 10:04:29.260585: [TUN] [if_1ea7d00c23a616b1] Routine:
receive incoming IPv4 - started
2021-01-21 10:04:29.263610: [TUN] [if_1ea7d00c23a616b1] UDP bind has
been updated
2021-01-21 10:04:29.266180: [TUN] [if_1ea7d00c23a616b1] peer(m6bQ.Rxw)
- Starting...
2021-01-21 10:04:29.267507: [TUN] [if_1ea7d00c23a616b1]
peer(m6bQ.RKxw) - Routine: sequential receiver - started
2021-01-21 10:04:29.268329: [TUN] [if_1ea7d00c23a616b1]
peer(m6bQ.RKxw) - Routine: nonce worker - started
2021-01-21 10:04:29.269543: [TUN] [if_1ea7d00c23a616b1]
peer(m6bQ.RKxw) - Routine: sequential sender - started
2021-01-21 10:04:29.269543: [TUN] [if_1ea7d00c23a616b1] Monitoring
default v4 routes
2021-01-21 10:04:29.269543: [TUN] [if_1ea7d00c23a616b1] Binding v4
socket to interface 49 (blackhole=3Dfalse)
2021-01-21 10:04:29.271167: [TUN] [if_1ea7d00c23a616b1] Setting device
v4 addresses
2021-01-21 10:04:29.520194: [TUN] [if_1ea7d00c23a616b1] Monitoring
default v6 routes
2021-01-21 10:04:29.520194: [TUN] [if_1ea7d00c23a616b1] Binding v6
socket to interface 49 (blackhole=3Dfalse)
2021-01-21 10:04:29.521131: [TUN] [if_1ea7d00c23a616b1] Setting device
v6 addresses
2021-01-21 10:04:29.753887: [TUN] [if_1ea7d00c23a616b1] Listening for
UAPI requests
2021-01-21 10:04:29.753887: [TUN] [if_1ea7d00c23a616b1] Startup complete

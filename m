Return-Path: <SRS0=dzZU=BW=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CCFCC433E1
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 12 Aug 2020 18:35:20 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0A8AA2080C
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 12 Aug 2020 18:35:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ixl3IDPZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0A8AA2080C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4232b4da;
	Wed, 12 Aug 2020 18:09:53 +0000 (UTC)
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com
 [2607:f8b0:4864:20::42a])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 54d0daf7
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 12 Aug 2020 15:34:40 +0000 (UTC)
Received: by mail-pf1-x42a.google.com with SMTP id d22so1241198pfn.5
 for <wireguard@lists.zx2c4.com>; Wed, 12 Aug 2020 09:00:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to
 :content-transfer-encoding;
 bh=2SvSU8BeeZQ03WDBPblcJ6BNdAf/Rl81qrzOcP6BWGA=;
 b=Ixl3IDPZHe8YaDGBrhPSKg304uFO+ybpswu7jGG/QbRTPk7wvnoR4W23M0yKqp8Hv1
 s2D7tV15NLXYtZK9M72Q6NIrbP6hb7NgbKHNF0ZR7vBgbiGXSG7D7mpR29cCWdH9Hr0V
 AM2Wi8N9HwAT1uvSM4aKOE00wjzXMVUiCKEh1I/uVP1c+HRzMXPMJ5bx8NAk8S0DAW3y
 50NalPnVUxYEW4YhYI7XBlT2ZXnJFQFXVC+HO+HxRcQYNDSzTpXR/1wcbHnQerswc2sq
 SypqzUNLV6kyyYWE7h8zNnm/aZ8+GrRSxhp4bd0rMpzfzTURPblwd7C2OiteqE2mpD3L
 GRbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to
 :content-transfer-encoding;
 bh=2SvSU8BeeZQ03WDBPblcJ6BNdAf/Rl81qrzOcP6BWGA=;
 b=P1AdFSXF0Rruvlz9G9fFz5c+9Ilhz/cNmzwYK25tfzMY7hLZYsjMWbRRU0u0NwS0Iz
 IWVdwGvOFqOhzuwVHZENVXjOd1o6kBTMK5y/k3QxYSxAghepUajn0QFvMUnvgMP7+o85
 CgUL2/oojiszs4XuuaTto2FnRa0Vjp0wrZDkHHGQKKKjdpdt6bfE36LBOMLdRBrgQfV3
 CnrBsCSOLYAHy8aqtYskfjRC343+PyOwE/xbUGh7FHxM5x2c8NwdWoxqx2be/fu0ZAWF
 58jZvtjxgWkpZx70C4NAccUrvfK8Z6WzIdnNhE3Rrt7jiwXiDFgqhVNgcOgJXLIJWGF5
 GXYw==
X-Gm-Message-State: AOAM530JyfakwNSENDCbAUMtdhJh7uVh3ZwjP2cbDLlri5zrQlvLLqr4
 uX/C55N2NShz5oY81xWPkkgc4kt8MF4J8ih2votYag9A
X-Google-Smtp-Source: ABdhPJxQSDqMbMXNWqvD7yvQhGhjdOxCbfLG5PX8je5z3YMTcJ7iEC0l+eacloCdYvoJloIW5WOgChShowfTZgS3r60=
X-Received: by 2002:a63:4c57:: with SMTP id m23mr5479622pgl.77.1597248003275; 
 Wed, 12 Aug 2020 09:00:03 -0700 (PDT)
MIME-Version: 1.0
From: James Hartig <fastest963@gmail.com>
Date: Wed, 12 Aug 2020 11:59:27 -0400
Message-ID: <CAM6j61tG5EQvRHyABUyh2uGg0sLJD8tURT-NWxDdaV1Q3rOqvg@mail.gmail.com>
Subject: Windows firewall rules not being correctly setup
To: wireguard@lists.zx2c4.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Wed, 12 Aug 2020 20:09:50 +0200
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

I have the latest Wireguard installed on Windows 10 (2004). Whenever I
try to use the wg client to configure the WireGuard tunnel the tunnel
doesn't properly receive packets but if I start the Windows service
with the conf file populated with peer information then it more often
than not works but still not all the time.

If the configuration file has a peer section when I start up the
WireGuard service then the tunnel works fine and I can ping over the
tunnel.
Configuration file:
[Interface]
Address    =3D 172.28.128.2/30
PrivateKey =3D ...

[Peer]
PublicKey           =3D ...
Endpoint            =3D ...:...
AllowedIPs          =3D 172.28.128.3/32
PersistentKeepalive =3D 5

However, if I start up the WireGuard service without the peer
definition and use wg to configure the peer, the tunnel never works.
Configuration file:
[Interface]
Address    =3D 172.28.128.2/30
PrivateKey =3D ...

wg command:
wg set wgA peer ... endpoint ... allowed-ips 172.28.128.3/32
persistent-keepalive 5

I see that the tunnel is established and the bytes are increasing:
interface: wgA
  public key: ...
  private key: (hidden)
  listening port: 52299

peer: ...
  endpoint: ...
  allowed ips: 172.28.128.3/32
  latest handshake: 5 seconds ago
  transfer: 380 B received, 276 B sent
  persistent keepalive: every 5 seconds

If I do a tcpdump on the server I see incoming ping requests and responses:
23:19:18.626880 IP (tos 0x0, ttl 128, id 5334, offset 0, flags [none],
proto ICMP (1), length 60)
    172.28.128.2 > 172.28.128.3: ICMP echo request, id 1, seq 5662, length =
40
E..<..................7=3D....abcdefghijklmnopqrstuvwabcdefghi
23:19:18.626956 IP (tos 0x0, ttl 64, id 16519, offset 0, flags [none],
proto ICMP (1), length 60)
    172.28.128.3 > 172.28.128.2: ICMP echo reply, id 1, seq 5662, length 40
E..<@...@.............?=3D....abcdefghijklmnopqrstuvwabcdefghi

But locally on Windows I can't get WireShark or netsh trace to include
traffic on the tun interface but if I look at the UDP traffic over my
main interface I can see the UDP packets incoming with the echo reply.

The only thing I can figure out so far is that wfp seems to be
blocking the packets whenever I use wg to configure the peer. If I
disable the Windows firewall via the GUI then traffic works in both
directions and everything is fine. When I have the firewall enabled
and I run netsh wfp show netevents I see lots of:
<item>
<header>
<timeStamp>2020-08-12T15:56:49.641Z</timeStamp>
<flags numItems=3D"8">
<item>FWPM_NET_EVENT_FLAG_IP_PROTOCOL_SET</item>
<item>FWPM_NET_EVENT_FLAG_LOCAL_ADDR_SET</item>
<item>FWPM_NET_EVENT_FLAG_REMOTE_ADDR_SET</item>
<item>FWPM_NET_EVENT_FLAG_LOCAL_PORT_SET</item>
<item>FWPM_NET_EVENT_FLAG_APP_ID_SET</item>
<item>FWPM_NET_EVENT_FLAG_USER_ID_SET</item>
<item>FWPM_NET_EVENT_FLAG_IP_VERSION_SET</item>
<item>FWPM_NET_EVENT_FLAG_PACKAGE_ID_SET</item>
</flags>
<ipVersion>FWP_IP_VERSION_V4</ipVersion>
<ipProtocol>1</ipProtocol>
<localAddrV4>172.28.128.2</localAddrV4>
<remoteAddrV4>172.28.128.3</remoteAddrV4>
<localPort>8</localPort>
<remotePort>0</remotePort>
<scopeId>0</scopeId>
<appId>
<data>530079007300740065006d000000</data>
<asString>S.y.s.t.e.m...</asString>
</appId>
<userId>S-1-5-18</userId>
<addressFamily>FWP_AF_INET</addressFamily>
<packageSid>S-1-0-0</packageSid>
<enterpriseId/>
<policyFlags>0</policyFlags>
<effectiveName/>
</header>
<type>FWPM_NET_EVENT_TYPE_CLASSIFY_DROP</type>
<classifyDrop>
<filterId>790758</filterId>
<layerId>44</layerId>
<reauthReason>0</reauthReason>
<originalProfile>1</originalProfile>
<currentProfile>1</currentProfile>
<msFwpDirection>MS_FWP_DIRECTION_OUT</msFwpDirection>
<isLoopback>false</isLoopback>
<vSwitchId/>
<vSwitchSourcePort>0</vSwitchSourcePort>
<vSwitchDestinationPort>0</vSwitchDestinationPort>
</classifyDrop>
<internalFields>
<internalFlags/>
<remoteAddrBitmap>0000000000000000</remoteAddrBitmap>
<capabilities/>
<fqbnVersion>0</fqbnVersion>
<fqbnName/>
<terminatingFiltersInfo numItems=3D"3">
<item>
<filterId>790740</filterId>
<subLayer>65535</subLayer>
<actionType>FWP_ACTION_PERMIT</actionType>
</item>
<item>
<filterId>792929</filterId>
<subLayer>FWPP_SUBLAYER_INTERNAL_FIREWALL_QUARANTINE</subLayer>
<actionType>FWP_ACTION_PERMIT</actionType>
</item>
<item>
<filterId>790758</filterId>
<subLayer>FWPP_SUBLAYER_INTERNAL_FIREWALL_WF</subLayer>
<actionType>FWP_ACTION_BLOCK</actionType>
</item>
</terminatingFiltersInfo>
</internalFields>
</item>

The 790740 filter is the filter that should be applied but for some
reason it's not:
<item>
<filterKey>{9ad60a16-7e29-4b44-832d-8d78d1e5ec4e}</filterKey>
<displayData>
<name>Permit inbound IPv4 traffic on TUN</name>
<description/>
</displayData>
<flags/>
<providerKey>{1eb59bfa-a556-4090-b85a-4c1ea9119051}</providerKey>
<providerData/>
<layerKey>FWPM_LAYER_ALE_AUTH_RECV_ACCEPT_V4</layerKey>
<subLayerKey>{d36dd15b-ce50-474c-b651-d95d016f7ad5}</subLayerKey>
<weight>
<type>FWP_UINT8</type>
<uint8>12</uint8>
</weight>
<filterCondition numItems=3D"1">
<item>
<fieldKey>FWPM_CONDITION_IP_LOCAL_INTERFACE</fieldKey>
<matchType>FWP_MATCH_EQUAL</matchType>
<conditionValue>
<type>FWP_UINT64</type>
<uint64>14918723538255872</uint64>
</conditionValue>
</item>
</filterCondition>
<action>
<type>FWP_ACTION_PERMIT</type>
<filterType/>
</action>
<rawContext>0</rawContext>
<reserved/>
<filterId>790740</filterId>
<effectiveWeight>
<type>FWP_UINT64</type>
<uint64>13837309855095848960</uint64>
</effectiveWeight>
</item>

Here's the log if that helps:
2020-08-11 16:16:58.797: [TUN] [wgA] Starting WireGuard/0.1.1 (Windows
10.0.19041; amd64)
2020-08-11 16:16:58.797: [TUN] [wgA] Watching network interfaces
2020-08-11 16:16:58.799: [TUN] [wgA] Resolving DNS names
2020-08-11 16:16:58.800: [TUN] [wgA] Creating Wintun interface
2020-08-11 16:16:59.118: [TUN] [wgA] Using Wintun/0.8 (NDIS 6.83)
2020-08-11 16:16:59.121: [TUN] [wgA] Enabling firewall rules
2020-08-11 16:16:59.146: [TUN] [wgA] Dropping privileges
2020-08-11 16:16:59.146: [TUN] [wgA] Creating interface instance
2020-08-11 16:16:59.147: [TUN] [wgA] Routine: encryption worker - started
2020-08-11 16:16:59.147: [TUN] [wgA] Routine: handshake worker - started
2020-08-11 16:16:59.147: [TUN] [wgA] Routine: decryption worker - started
2020-08-11 16:16:59.147: [TUN] [wgA] Routine: decryption worker - started
2020-08-11 16:16:59.148: [TUN] [wgA] Routine: encryption worker - started
2020-08-11 16:16:59.148: [TUN] [wgA] Routine: handshake worker - started
2020-08-11 16:16:59.148: [TUN] [wgA] Routine: decryption worker - started
2020-08-11 16:16:59.148: [TUN] [wgA] Routine: handshake worker - started
2020-08-11 16:16:59.149: [TUN] [wgA] Routine: encryption worker - started
2020-08-11 16:16:59.149: [TUN] [wgA] Routine: decryption worker - started
2020-08-11 16:16:59.149: [TUN] [wgA] Routine: handshake worker - started
2020-08-11 16:16:59.149: [TUN] [wgA] Routine: encryption worker - started
2020-08-11 16:16:59.149: [TUN] [wgA] Routine: decryption worker - started
2020-08-11 16:16:59.149: [TUN] [wgA] Routine: handshake worker - started
2020-08-11 16:16:59.150: [TUN] [wgA] Routine: encryption worker - started
2020-08-11 16:16:59.150: [TUN] [wgA] Routine: encryption worker - started
2020-08-11 16:16:59.150: [TUN] [wgA] Routine: decryption worker - started
2020-08-11 16:16:59.150: [TUN] [wgA] Routine: encryption worker - started
2020-08-11 16:16:59.150: [TUN] [wgA] Routine: decryption worker - started
2020-08-11 16:16:59.150: [TUN] [wgA] Routine: decryption worker - started
2020-08-11 16:16:59.151: [TUN] [wgA] Routine: handshake worker - started
2020-08-11 16:16:59.151: [TUN] [wgA] Routine: encryption worker - started
2020-08-11 16:16:59.151: [TUN] [wgA] Routine: decryption worker - started
2020-08-11 16:16:59.151: [TUN] [wgA] Routine: handshake worker - started
2020-08-11 16:16:59.151: [TUN] [wgA] Routine: handshake worker - started
2020-08-11 16:16:59.151: [TUN] [wgA] Routine: encryption worker - started
2020-08-11 16:16:59.152: [TUN] [wgA] Routine: encryption worker - started
2020-08-11 16:16:59.152: [TUN] [wgA] Routine: encryption worker - started
2020-08-11 16:16:59.152: [TUN] [wgA] Routine: decryption worker - started
2020-08-11 16:16:59.152: [TUN] [wgA] Routine: handshake worker - started
2020-08-11 16:16:59.152: [TUN] [wgA] Routine: handshake worker - started
2020-08-11 16:16:59.152: [TUN] [wgA] Routine: encryption worker - started
2020-08-11 16:16:59.152: [TUN] [wgA] Routine: handshake worker - started
2020-08-11 16:16:59.152: [TUN] [wgA] Routine: decryption worker - started
2020-08-11 16:16:59.153: [TUN] [wgA] Routine: event worker - started
2020-08-11 16:16:59.153: [TUN] [wgA] Routine: handshake worker - started
2020-08-11 16:16:59.153: [TUN] [wgA] Routine: decryption worker - started
2020-08-11 16:16:59.153: [TUN] [wgA] Routine: TUN reader - started
2020-08-11 16:16:59.153: [TUN] [wgA] Setting interface configuration
2020-08-11 16:16:59.153: [TUN] [wgA] UAPI: Updating private key
2020-08-11 16:16:59.154: [TUN] [wgA] Bringing peers up
2020-08-11 16:16:59.155: [TUN] [wgA] Routine: receive incoming IPv6 - start=
ed
2020-08-11 16:16:59.155: [TUN] [wgA] Routine: receive incoming IPv4 - start=
ed
2020-08-11 16:16:59.155: [TUN] [wgA] UDP bind has been updated
2020-08-11 16:16:59.155: [TUN] [wgA] Monitoring default v6 routes
2020-08-11 16:16:59.156: [TUN] [wgA] Binding v6 socket to interface 19
(blackhole=3Dfalse)
2020-08-11 16:16:59.157: [TUN] [wgA] Setting device v6 addresses
2020-08-11 16:16:59.313: [TUN] [wgA] Monitoring default v4 routes
2020-08-11 16:16:59.317: [TUN] [wgA] Binding v4 socket to interface 19
(blackhole=3Dfalse)
2020-08-11 16:16:59.320: [TUN] [wgA] Setting device v4 addresses
2020-08-11 16:16:59.633: [TUN] [wgA] Listening for UAPI requests
2020-08-11 16:16:59.633: [TUN] [wgA] Startup complete
2020-08-11 16:17:08.535: [TUN] [wgA] UAPI: Transition to peer configuration
2020-08-11 16:17:08.536: [TUN] [wgA] peer(b1vk=E2=80=A6FImg) - Starting...
2020-08-11 16:17:08.536: [TUN] [wgA] peer(b1vk=E2=80=A6FImg) - Routine:
sequential receiver - started
2020-08-11 16:17:08.536: [TUN] [wgA] peer(b1vk=E2=80=A6FImg) - Routine: non=
ce
worker - started
2020-08-11 16:17:08.536: [TUN] [wgA] peer(b1vk=E2=80=A6FImg) - Routine:
sequential sender - started
2020-08-11 16:17:08.536: [TUN] [wgA] peer(b1vk=E2=80=A6FImg) - UAPI: Create=
d
2020-08-11 16:17:08.537: [TUN] [wgA] peer(b1vk=E2=80=A6FImg) - UAPI: Updati=
ng endpoint
2020-08-11 16:17:08.537: [TUN] [wgA] peer(b1vk=E2=80=A6FImg) - UAPI: Removi=
ng
all allowedips
2020-08-11 16:17:08.537: [TUN] [wgA] peer(b1vk=E2=80=A6FImg) - UAPI: Adding=
 allowedip
2020-08-11 16:17:11.944: [TUN] [wgA] peer(b1vk=E2=80=A6FImg) - Sending
handshake initiation
2020-08-11 16:17:11.946: [TUN] [wgA] peer(b1vk=E2=80=A6FImg) - Awaiting key=
pair
2020-08-11 16:17:11.989: [TUN] [wgA] peer(b1vk=E2=80=A6FImg) - Received
handshake response
2020-08-11 16:17:11.991: [TUN] [wgA] peer(b1vk=E2=80=A6FImg) - Obtained awa=
ited keypair

Can someone share how I might debug further?

Thanks!

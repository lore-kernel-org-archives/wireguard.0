Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F72FC433EF
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 10 Mar 2022 01:00:55 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 9802f6d2;
	Thu, 10 Mar 2022 01:00:54 +0000 (UTC)
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com
 [2607:f8b0:4864:20::1030])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id b97d992c
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 10 Mar 2022 01:00:52 +0000 (UTC)
Received: by mail-pj1-x1030.google.com with SMTP id
 lj8-20020a17090b344800b001bfaa46bca3so3735743pjb.2
 for <wireguard@lists.zx2c4.com>; Wed, 09 Mar 2022 17:00:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prosimo.io; s=google;
 h=from:content-transfer-encoding:mime-version:subject:date:references
 :to:in-reply-to:message-id;
 bh=nQ6TQxjgj/qVtqBwbSbMF6cu/KbukTE2HUenbitCzQA=;
 b=ZsjujBJPhsUy1/hOIUe/EoRTzPrnyXnKPrK1/0lwCaAPIxxCkInhaYZrxNSLoUGyUV
 WOvmZ2ZKoG5b2tUwwOKz/xda89g3UCiiZmX3HEJLpEbogQRnbM6e6KSLHSStMcJllAM1
 4AkVoU/fANt4zKHxMIfGnmtLIgAFYX+7MSaHQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:content-transfer-encoding:mime-version
 :subject:date:references:to:in-reply-to:message-id;
 bh=nQ6TQxjgj/qVtqBwbSbMF6cu/KbukTE2HUenbitCzQA=;
 b=Dlpd5BIS63LPFTowTToAdiWpeMdLQzlKVcnaEFOUD8fo0PRb1iJdiFUEN92w3F3Uc2
 xcwjH+VnMsaW7zRBrnBuIPeloeggqN++HaMijjxRYC+A71clhrxszgKPzvEVVipgLzIB
 NdYJ4B5/Ix54038f1kOJoiHgSnUtaqc39qtdraFAM/HIZwoMl+V0x4Ia2ZkXjs9D27n+
 2A4S/kdOoxsnsQ+OYT/RzULRZb1kywbcRlrdswxy3Ni1Ed2ULiTf49ZjTUptio3nHkOV
 4+nsizDoj7MKZGHc6m5h+36QnxmB8l9cq0IuuZTWTa4jb7rIQgSxTSTqHcQa02P4fgC6
 mziA==
X-Gm-Message-State: AOAM531wrqvKzQ5k/AAQcL5iGSq724av1MhVTt+6TUz85F5zL15f1Mh1
 6PA1ojYnEozTBqPAAJxC/Nlq0eJG2oqOUA==
X-Google-Smtp-Source: ABdhPJwyVWrQiHpkC5EHRi01EqrF0HroCb0VIS1b/lGazuMyZispjyp8IjhWtiGk1JwuM6OFY8pOSg==
X-Received: by 2002:a17:902:a3cb:b0:151:e52e:fa0c with SMTP id
 q11-20020a170902a3cb00b00151e52efa0cmr2272961plb.70.1646874050334; 
 Wed, 09 Mar 2022 17:00:50 -0800 (PST)
Received: from smtpclient.apple
 (172-9-238-145.lightspeed.sntcca.sbcglobal.net. [172.9.238.145])
 by smtp.gmail.com with ESMTPSA id
 l10-20020a056a00140a00b004c55d0dcbd1sm4297724pfu.120.2022.03.09.17.00.49
 for <wireguard@lists.zx2c4.com>
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 09 Mar 2022 17:00:50 -0800 (PST)
From: Manikandan Thiagarajan <tmani@prosimo.io>
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (Mac OS X Mail 15.0 \(3693.60.0.1.1\))
Subject: Wireguard Go C API Callbacks
Date: Wed, 9 Mar 2022 17:00:48 -0800
References: <DBFC0427-180B-4757-A93A-0D9DECD959EE@prosimo.io>
To: wireguard@lists.zx2c4.com
In-Reply-To: <DBFC0427-180B-4757-A93A-0D9DECD959EE@prosimo.io>
Message-Id: <0BDD2370-8F67-43BD-9186-76FF85EE1FC1@prosimo.io>
X-Mailer: Apple Mail (2.3693.60.0.1.1)
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

Hi,

We are using Wireguard Go C API to integrate with our packet tunnel =
network extension to forward traffic to WG Tunnel on Mac OS. Sometimes =
We encounter some issues with the tunnel that it doesn=E2=80=99t respond =
anymore. Below log is one of the scenarios where we see this issue. The =
Wireguard log says "no buffer space available=E2=80=9D. Below are my =
questions regarding this issue and in general WG C API.

=E2=80=9C[Sun Mar  6 15:27:22 2022] 832, AgentPacketTunnelProvider.mm:41 =
[INFO]: Failed to read packet from TUN device: route ip+net: sysctl: no =
buffer space available"

1. When do we hit this issue? How do we prevent this.
2. I think we need some kind of callback C APIs that notifies such =
errors to the callers.
3. Also it would be nice to have status update callbacks such as Tunnel =
established, Handshake completed. Handshake failed, Tunnel file =
descriptor closed and any other updates.

We would like to handle these notifications and take some actions such =
as re create the tunnels, update our own UI, and etc

Thanks,
Mani

[Sun Mar  6 15:27:15 2022] 832, AgentPacketTunnelProvider.mm:41 [INFO]: =
Routine: receive incoming v4 - started
[Sun Mar  6 15:27:21 2022] 832, AgentPacketTunnelProvider.mm:41 [INFO]: =
Routine: event worker - stopped
replace_peers=3Dtrue
=
public_key=3Dxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx=
x
endpoint=3Dx.x.x.x:51820
persistent_keepalive_interval=3D0
replace_allowed_ips=3Dtrue
allowed_ip=3D10.50.19.176/32
=
public_key=3Dxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx=
x
endpoint=3Dx.x.x.x:51820
persistent_keepalive_interval=3D0
replace_allowed_ips=3Dtrue
allowed_ip=3D10.255.254.170/32

 for interface 100.140.34.230/11
[Sun Mar  6 15:27:21 2022] 832, AgentPacketTunnelProvider.mm:286 [INFO]: =
Update tunnel 0 CCConfig: =
private_key=3Dxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx=
xx
replace_peers=3Dtrue
=
public_key=3Dxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx=
x
endpoint=3Dx.x.x.x:51820
persistent_keepalive_interval=3D0
replace_allowed_ips=3Dtrue
allowed_ip=3D10.50.19.176/32
=
public_key=3Dxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx=
x
endpoint=3Dx.x.x.x:51820
persistent_keepalive_interval=3D0
replace_allowed_ips=3Dtrue
allowed_ip=3D10.255.254.170/32


[Sun Mar  6 15:27:21 2022] 832, AgentPacketTunnelProvider.mm:41 [INFO]: =
UAPI: Updating private key
[Sun Mar  6 15:27:21 2022] 832, AgentPacketTunnelProvider.mm:41 [INFO]: =
UAPI: Removing all peers
[Sun Mar  6 15:27:21 2022] 832, AgentPacketTunnelProvider.mm:41 [INFO]: =
peer(EBXr=E2=80=A6oDk8) - Stopping
[Sun Mar  6 15:27:21 2022] 832, AgentPacketTunnelProvider.mm:41 [INFO]: =
peer(EBXr=E2=80=A6oDk8) - Routine: sequential sender - stopped
[Sun Mar  6 15:27:21 2022] 832, AgentPacketTunnelProvider.mm:41 [INFO]: =
peer(EBXr=E2=80=A6oDk8) - Routine: sequential receiver - stopped
[Sun Mar  6 15:27:21 2022] 832, AgentPacketTunnelProvider.mm:41 [INFO]: =
peer(3wsi=E2=80=A68IXc) - Stopping
[Sun Mar  6 15:27:21 2022] 832, AgentPacketTunnelProvider.mm:41 [INFO]: =
peer(3wsi=E2=80=A68IXc) - Routine: sequential receiver - stopped
[Sun Mar  6 15:27:21 2022] 832, AgentPacketTunnelProvider.mm:41 [INFO]: =
peer(3wsi=E2=80=A68IXc) - Routine: sequential sender - stopped
[Sun Mar  6 15:27:21 2022] 832, AgentPacketTunnelProvider.mm:41 [INFO]: =
peer(EBXr=E2=80=A6oDk8) - Starting
[Sun Mar  6 15:27:21 2022] 832, AgentPacketTunnelProvider.mm:41 [INFO]: =
peer(EBXr=E2=80=A6oDk8) - Routine: sequential sender - started
[Sun Mar  6 15:27:21 2022] 832, AgentPacketTunnelProvider.mm:41 [INFO]: =
peer(EBXr=E2=80=A6oDk8) - UAPI: Created
[Sun Mar  6 15:27:21 2022] 832, AgentPacketTunnelProvider.mm:41 [INFO]: =
peer(EBXr=E2=80=A6oDk8) - Routine: sequential receiver - started
[Sun Mar  6 15:27:21 2022] 832, AgentPacketTunnelProvider.mm:41 [INFO]: =
peer(EBXr=E2=80=A6oDk8) - UAPI: Updating endpoint
[Sun Mar  6 15:27:21 2022] 832, AgentPacketTunnelProvider.mm:41 [INFO]: =
peer(EBXr=E2=80=A6oDk8) - UAPI: Updating persistent keepalive interval
[Sun Mar  6 15:27:21 2022] 832, AgentPacketTunnelProvider.mm:41 [INFO]: =
peer(EBXr=E2=80=A6oDk8) - UAPI: Removing all allowedips
[Sun Mar  6 15:27:21 2022] 832, AgentPacketTunnelProvider.mm:41 [INFO]: =
peer(EBXr=E2=80=A6oDk8) - UAPI: Adding allowedip
[Sun Mar  6 15:27:21 2022] 832, AgentPacketTunnelProvider.mm:41 [INFO]: =
peer(3wsi=E2=80=A68IXc) - Starting
[Sun Mar  6 15:27:21 2022] 832, AgentPacketTunnelProvider.mm:41 [INFO]: =
peer(3wsi=E2=80=A68IXc) - UAPI: Created
[Sun Mar  6 15:27:21 2022] 832, AgentPacketTunnelProvider.mm:41 [INFO]: =
peer(3wsi=E2=80=A68IXc) - Routine: sequential receiver - started
[Sun Mar  6 15:27:21 2022] 832, AgentPacketTunnelProvider.mm:41 [INFO]: =
peer(3wsi=E2=80=A68IXc) - Routine: sequential sender - started
[Sun Mar  6 15:27:21 2022] 832, AgentPacketTunnelProvider.mm:41 [INFO]: =
peer(3wsi=E2=80=A68IXc) - UAPI: Updating endpoint
[Sun Mar  6 15:27:21 2022] 832, AgentPacketTunnelProvider.mm:41 [INFO]: =
peer(3wsi=E2=80=A68IXc) - UAPI: Updating persistent keepalive interval
[Sun Mar  6 15:27:21 2022] 832, AgentPacketTunnelProvider.mm:41 [INFO]: =
peer(3wsi=E2=80=A68IXc) - UAPI: Removing all allowedips
[Sun Mar  6 15:27:21 2022] 832, AgentPacketTunnelProvider.mm:41 [INFO]: =
peer(3wsi=E2=80=A68IXc) - UAPI: Adding allowedip
[Sun Mar  6 15:27:21 2022] 832, AgentPacketTunnelProvider.mm:41 [INFO]: =
Routine: receive incoming v4 - stopped
[Sun Mar  6 15:27:21 2022] 832, AgentPacketTunnelProvider.mm:41 [INFO]: =
Routine: receive incoming v6 - stopped
[Sun Mar  6 15:27:21 2022] 832, AgentPacketTunnelProvider.mm:41 [INFO]: =
UDP bind has been updated
[Sun Mar  6 15:27:21 2022] 832, AgentPacketTunnelProvider.mm:41 [INFO]: =
Routine: receive incoming v6 - started
[Sun Mar  6 15:27:21 2022] 832, AgentPacketTunnelProvider.mm:41 [INFO]: =
Routine: receive incoming v4 - started
[Sun Mar  6 15:27:22 2022] 832, AgentPacketTunnelProvider.mm:41 [INFO]: =
Failed to read packet from TUN device: route ip+net: sysctl: no buffer =
space available
[Sun Mar  6 15:27:22 2022] 832, AgentPacketTunnelProvider.mm:41 [INFO]: =
Routine: TUN reader - stopped
[Sun Mar  6 15:27:22 2022] 832, AgentPacketTunnelProvider.mm:41 [INFO]: =
Device closing
[Sun Mar  6 15:27:22 2022] 832, AgentPacketTunnelProvider.mm:41 [INFO]: =
Routine: receive incoming v4 - stopped
[Sun Mar  6 15:27:22 2022] 832, AgentPacketTunnelProvider.mm:41 [INFO]: =
Routine: receive incoming v6 - stopped
[Sun Mar  6 15:27:22 2022] 832, AgentPacketTunnelProvider.mm:41 [INFO]: =
peer(EBXr=E2=80=A6oDk8) - Stopping
[Sun Mar  6 15:27:22 2022] 832, AgentPacketTunnelProvider.mm:41 [INFO]: =
peer(EBXr=E2=80=A6oDk8) - Routine: sequential sender - stopped
[Sun Mar  6 15:27:22 2022] 832, AgentPacketTunnelProvider.mm:41 [INFO]: =
peer(EBXr=E2=80=A6oDk8) - Routine: sequential receiver - stopped
[Sun Mar  6 15:27:22 2022] 832, AgentPacketTunnelProvider.mm:41 [INFO]: =
peer(3wsi=E2=80=A68IXc) - Stopping
[Sun Mar  6 15:27:22 2022] 832, AgentPacketTunnelProvider.mm:41 [INFO]: =
peer(3wsi=E2=80=A68IXc) - Routine: sequential sender - stopped
[Sun Mar  6 15:27:22 2022] 832, AgentPacketTunnelProvider.mm:41 [INFO]: =
peer(3wsi=E2=80=A68IXc) - Routine: sequential receiver - stopped
[Sun Mar  6 15:27:22 2022] 832, AgentPacketTunnelProvider.mm:41 [INFO]: =
Device closed
[Sun Mar  6 15:27:22 2022] 832, AgentPacketTunnelProvider.mm:41 [INFO]: =
Routine: decryption worker 2 - stopped
[Sun Mar  6 15:27:22 2022] 832, AgentPacketTunnelProvider.mm:41 [INFO]: =
Routine: decryption worker 11 - stopped
[Sun Mar  6 15:27:22 2022] 832, AgentPacketTunnelProvider.mm:41 [INFO]: =
Routine: decryption worker 6 - stopped
[Sun Mar  6 15:27:22 2022] 832, AgentPacketTunnelProvider.mm:41 [INFO]: =
Routine: decryption worker 10 - stopped
[Sun Mar  6 15:27:22 2022] 832, AgentPacketTunnelProvider.mm:41 [INFO]: =
Routine: handshake worker 7 - stopped
[Sun Mar  6 15:27:22 2022] 832, AgentPacketTunnelProvider.mm:41 [INFO]: =
Routine: decryption worker 4 - stopped
[Sun Mar  6 15:27:22 2022] 832, AgentPacketTunnelProvider.mm:41 [INFO]: =
Routine: handshake worker 10 - stopped
[Sun Mar  6 15:27:22 2022] 832, AgentPacketTunnelProvider.mm:41 [INFO]: =
Routine: decryption worker 5 - stopped
[Sun Mar  6 15:27:22 2022] 832, AgentPacketTunnelProvider.mm:41 [INFO]: =
Routine: decryption worker 12 - stopped
[Sun Mar  6 15:27:22 2022] 832, AgentPacketTunnelProvider.mm:41 [INFO]: =
Routine: handshake worker 2 - stopped
[Sun Mar  6 15:27:22 2022] 832, AgentPacketTunnelProvider.mm:41 [INFO]: =
Routine: decryption worker 7 - stopped
[Sun Mar  6 15:27:22 2022] 832, AgentPacketTunnelProvider.mm:41 [INFO]: =
Routine: decryption worker 8 - stopped
[Sun Mar  6 15:27:22 2022] 832, AgentPacketTunnelProvider.mm:41 [INFO]: =
Routine: decryption worker 1 - stopped
[Sun Mar  6 15:27:22 2022] 832, AgentPacketTunnelProvider.mm:41 [INFO]: =
Routine: decryption worker 9 - stopped
[Sun Mar  6 15:27:22 2022] 832, AgentPacketTunnelProvider.mm:41 [INFO]: =
Routine: handshake worker 9 - stopped
[Sun Mar  6 15:27:22 2022] 832, AgentPacketTunnelProvider.mm:41 [INFO]: =
Routine: handshake worker 5 - stopped
[Sun Mar  6 15:27:22 2022] 832, AgentPacketTunnelProvider.mm:41 [INFO]: =
Routine: handshake worker 1 - stopped
[Sun Mar  6 15:27:22 2022] 832, AgentPacketTunnelProvider.mm:41 [INFO]: =
Routine: decryption worker 3 - stopped
[Sun Mar  6 15:27:22 2022] 832, AgentPacketTunnelProvider.mm:41 [INFO]: =
Routine: handshake worker 11 - stopped
[Sun Mar  6 15:27:22 2022] 832, AgentPacketTunnelProvider.mm:41 [INFO]: =
Routine: handshake worker 8 - stopped
[Sun Mar  6 15:27:22 2022] 832, AgentPacketTunnelProvider.mm:41 [INFO]: =
Routine: handshake worker 12 - stopped
[Sun Mar  6 15:27:22 2022] 832, AgentPacketTunnelProvider.mm:41 [INFO]: =
Routine: handshake worker 4 - stopped
[Sun Mar  6 15:27:22 2022] 832, AgentPacketTunnelProvider.mm:41 [INFO]: =
Routine: handshake worker 3 - stopped
[Sun Mar  6 15:27:22 2022] 832, AgentPacketTunnelProvider.mm:41 [INFO]: =
Routine: handshake worker 6 - stopped
[Sun Mar  6 15:27:22 2022] 832, AgentPacketTunnelProvider.mm:41 [INFO]: =
Routine: encryption worker 5 - stopped
[Sun Mar  6 15:27:22 2022] 832, AgentPacketTunnelProvider.mm:41 [INFO]: =
Routine: encryption worker 9 - stopped
[Sun Mar  6 15:27:22 2022] 832, AgentPacketTunnelProvider.mm:41 [INFO]: =
Routine: encryption worker 6 - stopped
[Sun Mar  6 15:27:22 2022] 832, AgentPacketTunnelProvider.mm:41 [INFO]: =
Routine: encryption worker 11 - stopped
[Sun Mar  6 15:27:22 2022] 832, AgentPacketTunnelProvider.mm:41 [INFO]: =
Routine: encryption worker 12 - stopped
[Sun Mar  6 15:27:22 2022] 832, AgentPacketTunnelProvider.mm:41 [INFO]: =
Routine: encryption worker 3 - stopped
[Sun Mar  6 15:27:22 2022] 832, AgentPacketTunnelProvider.mm:41 [INFO]: =
Routine: encryption worker 10 - stopped
[Sun Mar  6 15:27:22 2022] 832, AgentPacketTunnelProvider.mm:41 [INFO]: =
Routine: encryption worker 4 - stopped
[Sun Mar  6 15:27:22 2022] 832, AgentPacketTunnelProvider.mm:41 [INFO]: =
Routine: encryption worker 1 - stopped
[Sun Mar  6 15:27:22 2022] 832, AgentPacketTunnelProvider.mm:41 [INFO]: =
Routine: encryption worker 7 - stopped
[Sun Mar  6 15:27:22 2022] 832, AgentPacketTunnelProvider.mm:41 [INFO]: =
Routine: encryption worker 8 - stopped
[Sun Mar  6 15:27:22 2022] 832, AgentPacketTunnelProvider.mm:41 [INFO]: =
Routine: encryption worker 2 - stopped



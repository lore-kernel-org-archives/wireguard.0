Return-Path: <SRS0=r1yQ=KO=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2991DC433B4
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 19 May 2021 18:26:16 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 54F8261244
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 19 May 2021 18:26:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 54F8261244
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d28dce78;
	Wed, 19 May 2021 18:26:13 +0000 (UTC)
Received: from mail-io1-xd33.google.com (mail-io1-xd33.google.com
 [2607:f8b0:4864:20::d33])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 27f29d4a
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 18 May 2021 11:22:43 +0000 (UTC)
Received: by mail-io1-xd33.google.com with SMTP id n10so9001621ion.8
 for <wireguard@lists.zx2c4.com>; Tue, 18 May 2021 04:22:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to
 :content-transfer-encoding;
 bh=FW8VTFXu6uxzaGOLXM3ZjXqoB0tjL/urpEXFSCMg0yA=;
 b=LV0l+ENsSqTLzjvmy2deT4RHlTIDkdBUAaMCb11yG6+WRTIqFuU6vc/2kt9wxbrm+1
 JrUe04aiKYV6c8iNnlu70n1pNYb9W++GddTsfQVPLDQZrg77n7RRFCQe1M2U01XgehiW
 8uJA1AMgynUKHo5CgansjQcxBLENLr8vpA7D1iflH4tMAhrzq7LVE9yr8TACeKvA2L6U
 8Rmi6phAWbXCP275G6FPaZeRqhdHZovroN5eKsucSm6sme5tsY7buhTu6Zn9rhsbOb53
 S60mtehVtZ8TInXyit5vfp/Npiy+2kRbwEHDCjPaenv/GhpwT3AHqaAVlnm7vu1uSxP3
 3FWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to
 :content-transfer-encoding;
 bh=FW8VTFXu6uxzaGOLXM3ZjXqoB0tjL/urpEXFSCMg0yA=;
 b=DqwhNrEfKygfq1aT9og/bcwJS3ll/UsE19lj6t2lugOZPi3h94AMa5W58AhslhJykU
 eRIKIkLdn07dOFRKRXflcILEeygwy2o27RmCkZkOZ04ngskquQEUnCWJTXJ5XMnSF9sK
 IliZ0siFhaqc/4qvq7nncJvoZkA8jx4Vy6OHSub2kl1VarXiQrbRunGixDYqkdoeek27
 hiIP4id5d5URqYOkGEMxdA2EKyHJ6CZrHtgruoQUujLy7+CQP0H0vaJqYvmI9O3LjfBt
 ahtwCJKTYIkbA4G1oU3OMEBFFrBYBwiGbnHbcspovghwSw7lLQtyDXLySsOsLm9YLKVY
 09Uw==
X-Gm-Message-State: AOAM533HMFF/kssI4UGwKmHA1Hc+S6Xl0lT8BQkDVjAADrIMxCMmjgbv
 OjLTEqsnFfqzYFpSs9IoWbpiF5zUHZXQud3ss9heJ/ewNIz88g==
X-Google-Smtp-Source: ABdhPJwus5hGEorBhXVSpC2r41C0iWaFWxPoibfEOAQEnQhq2L8mQf88tHRXXSSeZaTYYg22JyrjkhkTb29rVadFpM4=
X-Received: by 2002:a02:cb04:: with SMTP id j4mr4921764jap.45.1621336962317;
 Tue, 18 May 2021 04:22:42 -0700 (PDT)
MIME-Version: 1.0
From: Vicente Bergas <vicencb@gmail.com>
Date: Tue, 18 May 2021 13:22:31 +0200
Message-ID: <CAAMcf8BeGzUppFzfc2hF9KvpfU1DfSpncYv4AaK5Qf8_+fC-Rw@mail.gmail.com>
Subject: lost connection on dynamic IP
To: wireguard@lists.zx2c4.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Wed, 19 May 2021 18:26:11 +0000
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

Hi, i've got the following setup:
A server connected to the Internet through an ISP that provides a
dynamic IP with NAT.
The server keeps the DNS updated with https://github.com/troglobit/inadyn
A client on a tiny embedded board connects to the server by means of
its domain name.
Wireguard configurations are:
# server/etc/wireguard/wg0.conf
[Interface]
ListenPort =3D port_number
PrivateKey =3D ...
[Peer]
PublicKey =3D ...
PresharedKey =3D ...
PersistentKeepalive =3D 25
AllowedIPs =3D 10.0.0.2

# client/etc/wireguard/wg0.conf
[Interface]
PrivateKey =3D ...
[Peer]
PublicKey =3D ...
PresharedKey =3D ...
Endpoint =3D domain.name.that.resolves.to.a.dynamic.ip:port_number
PersistentKeepalive =3D 25
AllowedIPs =3D 10.0.0.1

The server almost never initiates comunications towards the client.
The client sends one packet every minute towards the server.

I think the issue happens when the ISP on the server side shuts down
the Internet connection for more than 1 hour! Then, it is restored
with a new IP.
inadyn detects the new IP and updates the DNS.
At this point the Internet connection is operational again, but the
client remains disconnected until rebooted.

Is this scenario expected to work due to the "Built-in Roaming" ?

Regards,
  Vicen=C3=A7.

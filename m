Return-Path: <SRS0=yJRU=6U=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86AE2C47259
	for <zx2c4-wireguard@archiver.kernel.org>; Wed,  6 May 2020 10:51:35 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F021B206B8
	for <zx2c4-wireguard@archiver.kernel.org>; Wed,  6 May 2020 10:51:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=ims-evolve-com.20150623.gappssmtp.com header.i=@ims-evolve-com.20150623.gappssmtp.com header.b="dneftefi"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F021B206B8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ims-evolve.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4553ccfb;
	Wed, 6 May 2020 10:37:34 +0000 (UTC)
Received: from mail-il1-x12d.google.com (mail-il1-x12d.google.com
 [2607:f8b0:4864:20::12d])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id d673f294
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Mon, 4 May 2020 13:34:45 +0000 (UTC)
Received: by mail-il1-x12d.google.com with SMTP id w6so11286954ilg.1
 for <wireguard@lists.zx2c4.com>; Mon, 04 May 2020 06:47:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ims-evolve-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:from:date:message-id:subject:to
 :content-transfer-encoding;
 bh=H05cvXHsLphnTzuyLluRa+wE4SRn4MWPBr+lNGWm7h8=;
 b=dneftefi5/K3UQL5b/W9xfqtwGHL2MxU9c1IKufUOvToOuYkdDhcBnsJgATkBOiDGN
 2wFSOyT66WA64MasTKOO3cdeCHULmfm0mR4IF62jM+hqG9OedF/TDUxMxOlg3laKSjHK
 5a6So0q33RwHHgCTEGrsPXCEz9kzP5dYvW51XS5p4zgS2+zzH09UTs7zIokAUckiQ+in
 Y7Ble+U6Q1/styXk4/U2qDjv/XTptzKBjoSkCL2qV9lc6rxsoKuNvldJIbnMqW2H5z9g
 BoiMWTN9G/BSokrIUgP6aXZlEqzTmU85HrIKgN15/J84gLxT/gtEX2a4t8ftPYBN+t8I
 OWEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to
 :content-transfer-encoding;
 bh=H05cvXHsLphnTzuyLluRa+wE4SRn4MWPBr+lNGWm7h8=;
 b=G1evbejma2Mr6/ELMncnhdFGr4kEBOvbCH26pYCKL0XSTlhzGbekXFQmDRIddDrhlN
 AYukqkWyE2nIzZVdW3l9ceppOUaLtk4+T3a8SdYfBrR3vArGt6iiStv6aqCy/xVzdtRR
 /8NnZu0tEZGtDkf/nYw/zrdUzkxKxPKYUTfk4P4keyIS86nJmEbnXnsCxTr0Sm1NwO28
 voKtzzpKdZkDkrtVJxFhwWm85hR8ddeDe++ZmEIyirqu+KsZMfNfyFWUoCQBfsZyeGHF
 xC3JPrKnrNDJJ2dhFu68eXK28k5Lvc3FDZu2t3OKnnYAQXkm6Q7JD/Yoi/uFPfXZ58yq
 s0qg==
X-Gm-Message-State: AGi0Pub4Y5IuljmVUwPOo7xVXN4HA1/DbJHzxfcZVV1ID7Edtoi2mBG4
 xszZjGXbzD4TOOXFkmjcTis0RWgpZGv7a3vxMQ8sveBg9+iDQPNvOUf4HaeYFvEVJS6D5dR2bGE
 UajvAK5f+W7RAvzaa3QKJoon5GFOhUEMsPPz6
X-Google-Smtp-Source: APiQypLrdBEDKP5bXwu0NgwbtHi4sUYl36lK0KfoRs962872LnzzE+xLkO4jUkaSaf+UamkDHOWObXKS1zgXm9PS1Cg=
X-Received: by 2002:a92:91d7:: with SMTP id e84mr16886334ill.255.1588600026502; 
 Mon, 04 May 2020 06:47:06 -0700 (PDT)
MIME-Version: 1.0
From: James Sinton <james.sinton@ims-evolve.com>
Date: Mon, 4 May 2020 14:46:55 +0100
Message-ID: <CA+cnKDFc2D2qJXsvonUS4sKUvvw8At-Mob-h5WBdN4LZvAFfQQ@mail.gmail.com>
Subject: Throughput with Wireguard
To: wireguard@lists.zx2c4.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Wed, 06 May 2020 12:37:33 +0200
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

I was wondering whether anyone has any experience with Wireguard from
a performance point of view.  I'm looking at experimenting with a
solution to connect anything up to 10000 remote devices, to a cluster
of Wireguard endpoints.  These devices will be connected all of the
time sending data.  Probably terminating at AWS, Azure or GCP
endpoints.

I was wondering whether anyone had experience with Wireguard's
throughput capabilities against the resources needed.

Are there any inherent limitations to be aware of?
For example, is there a limit to the size of config that can be loaded?

Regards,

James Sinton
Technology Platform Manager
IMS Evolve | Better Choices Made Possible


The content of this message is confidential. If you have received it
by mistake, please inform us by an email reply and then delete the
message. It is forbidden to copy, forward, or in any way reveal the
contents of this message to anyone. The integrity and security of this
email cannot be guaranteed over the Internet. Therefore, the sender
will not be held liable for any damage caused by the message.
Intelligent Maintenance Systems Ltd is registered in England. Company
No. 04079715 Registered Address: 1st Floor, Matrix House, North Fourth
Street, Milton Keynes, MK9 1NJ

--=20
This e-mail, including any attachments, is intended for the=C2=A0above name=
d=C2=A0
recipient(s) only and may be confidential=C2=A0and the subject of legal=20
professional privilege.=C2=A0

Any disclosure, use, storage or copying of this=C2=A0
email=C2=A0without the consent of the sender is strictly prohibited.=C2=A0P=
lease=20
notify the sender immediately=C2=A0if=C2=A0you=C2=A0are not the intended re=
cipient and=20
then delete the=C2=A0email=C2=A0from=C2=A0your inbox and do not disclose th=
e contents to=20
another person, use, copy or store the information in any medium.

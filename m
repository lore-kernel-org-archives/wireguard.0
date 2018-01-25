Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9cf71266
 for <wireguard@lists.zx2c4.com>;
 Thu, 25 Jan 2018 11:03:55 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5f455163
 for <wireguard@lists.zx2c4.com>;
 Thu, 25 Jan 2018 11:03:54 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7ab5daf9
 for <wireguard@lists.zx2c4.com>;
 Thu, 25 Jan 2018 10:55:03 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id b2fe1ce9
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 25 Jan 2018 10:55:03 +0000 (UTC)
Received: by mail-oi0-f42.google.com with SMTP id m83so4962097oik.8
 for <wireguard@lists.zx2c4.com>; Thu, 25 Jan 2018 03:08:14 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CAMEMCsKxKHtn2ARFchYVTrj2r_ArHQ4DeqaaSYUh96ZKrVk3GA@mail.gmail.com>
References: <CAMEMCsKxKHtn2ARFchYVTrj2r_ArHQ4DeqaaSYUh96ZKrVk3GA@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Thu, 25 Jan 2018 12:08:13 +0100
Message-ID: <CAHmME9oZ=4fEB+CTPPXLz=b=HZCOkVy02dVfVh4=Ri=bH80UjQ@mail.gmail.com>
Subject: Re: Bridging wg and normal interfaces?
To: =?UTF-8?Q?Rafa=C5=82_Grasman?= <grasmanek94@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

WireGuard is layer 3, not layer 2, so bridging is not what you want.

Instead, do ordinary IP routing between different subnets. As you
appear to already have different subnets, this shouldn't be a problem.

If you'd like to overlap within the same subnet, there's always proxy
arp, but I'd caution against that approach.

Lots of people run into this confusion about layer 2 vs layer 3. We
can probably walk you through getting things rolling for your
particular setup in #wireguard on Freenode, if you have IRC.

Jason

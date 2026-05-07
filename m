Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 798B5CD343F
	for <zx2c4-wireguard@archiver.kernel.org>; Thu,  7 May 2026 13:01:35 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id a07fd967;
	Thu, 7 May 2026 13:01:33 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id f96e67d9
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Thu, 7 May 2026 13:01:26 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id C946A40977
 for <wireguard@lists.zx2c4.com>; Thu,  7 May 2026 13:01:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57EBDC2BCB2
 for <wireguard@lists.zx2c4.com>; Thu,  7 May 2026 13:01:24 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="DeLapTTp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1778158877;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7W3hZnFbTWHvd181LJz1AIljMM+BhgiLK9xfVAtxe7c=;
 b=DeLapTTp5jpKhxGBIbVk4W9TeJCkEIxhLLGuzfR7RmM0Ld7VFQu6VewebxAdTuRwgnLJH7
 KlOvYXwpBpbxON59BhQSt011jGma81Ax+PccifXwrDavZy89u4wIGYe69ua2Eh4FxQVkdy
 D73P4S1ErirRJjr+tFKdSZ9gQPFXaYA=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 2eee5f77
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Thu, 7 May 2026 13:01:17 +0000 (UTC)
Received: by mail-oa1-f54.google.com with SMTP id
 586e51a60fabf-40ede943bf0so556071fac.2
 for <wireguard@lists.zx2c4.com>; Thu, 07 May 2026 06:01:17 -0700 (PDT)
X-Gm-Message-State: AOJu0YyIEXh0PXb3tgvKmw6jNmeV+Vn55ZMB+cSAoCQUqLR9YVLYI48q
 fN71yBeZx8d1OmnIMlEOZKM7SOkZG0vYhhVvSar9787TlMq3FYDQcvXsLUAi3AG8OCRP6dePdo7
 8DAeqL2VcEqwqS/8lPjrOQmAWgtmtmLA=
X-Received: by 2002:a05:6870:2006:b0:417:70c2:8537 with SMTP id
 586e51a60fabf-434f64e9121mr4569453fac.25.1778158874428; Thu, 07 May 2026
 06:01:14 -0700 (PDT)
MIME-Version: 1.0
References: <CAHmME9q4gC3Ag4hW0ERTkZNi6VMv1-qMExO6+OfOKYZ5rC4mgg@mail.gmail.com>
In-Reply-To: <CAHmME9q4gC3Ag4hW0ERTkZNi6VMv1-qMExO6+OfOKYZ5rC4mgg@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Thu, 7 May 2026 15:01:03 +0200
X-Gmail-Original-Message-ID: <CAHmME9oLbR71jKbL60y4T7mvhM7HzY30tSahNj4Y+WjV3M87Tw@mail.gmail.com>
X-Gm-Features: AVHnY4I0tHl6-1H7NWxZjEhlbRIbHpdP8BmIO0R5WHcKdU5jDme922RLrxJsE_o
Message-ID: <CAHmME9oLbR71jKbL60y4T7mvhM7HzY30tSahNj4Y+WjV3M87Tw@mail.gmail.com>
Subject: Re: Sunsetting support for old Windows versions
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
Cc: Simon Rozman <simon@rozman.si>
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

On Mon, Mar 23, 2026 at 6:09=E2=80=AFPM Jason A. Donenfeld <Jason@zx2c4.com=
> wrote:
> I must admit, however, that I am a bit sad about this. After coding up
> [1] this dialog box for the installer, I felt a few pangs of sadness
> when testing it for the first time on Windows 7 and seeing the tragic
> result: https://data.zx2c4.com/bye-bye-wg-win7.png . But it was a
> familiar feeling. For, long ago, I'd already watched the beauty of
> Windows fall to pieces. To me, Windows 2000 is the most beautiful of

In order to reduce user confusion, this dialog box for old Windows
installations is now augmented with this email thread opening:
https://data.zx2c4.com/windows7-update-sunset-flow.gif . This
especially helps with the update flow on old Windows, where dialog
boxes aren't shown. Hopefully this reduces the amount of confused
emails I've been receiving, while also not lulling old Windows users
into a false sense of security by disabling all update notifications.

Jason

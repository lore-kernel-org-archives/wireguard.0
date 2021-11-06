Return-Path: <SRS0=+cFr=P5=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4C3EC433EF
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 10 Nov 2021 00:56:09 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E1C2861184
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 10 Nov 2021 00:56:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E1C2861184
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c1564721;
	Wed, 10 Nov 2021 00:53:41 +0000 (UTC)
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com
 [2607:f8b0:4864:20::1035])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 663a401a
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Sat, 6 Nov 2021 21:20:31 +0000 (UTC)
Received: by mail-pj1-x1035.google.com with SMTP id
 t5-20020a17090a4e4500b001a0a284fcc2so5816922pjl.2
 for <wireguard@lists.zx2c4.com>; Sat, 06 Nov 2021 14:20:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:reply-to:from:date:message-id
 :subject:to:cc;
 bh=7/8GIw2iyazt89FJIy7kQF7uh4bWo8/vjlTORMTFqAU=;
 b=ZR2wr0RzpYL+X0DdT2gszBt4AUW7SgpNl6OC+X3I4WKTwYJOykTyNIPZBRTWNeeD61
 SHm7OcqciJyWPK5F8EjxptL1Z+Jl9EQPXXZKf0hxye+usbJPgPZLRabTccSFAm1ZWKYp
 yciDpe3ZqBygPB1FgqiKEMXlq+/gKXSMzKSbWmR/PpAHSBtvRm0nfok2CluLWPJn0z/E
 tfk76JFAZMIPfIsnivy3p+vHAcNQBs/g2pADWJngl4wprrUHqEElxdFsrJqCd5CSrvha
 X06Ey0iD+9/CLMGvt/zwZwIB3a3zcaKV55ZrtH6IDZW6b1G7Byx9dPkq3VnwgFpa+3q5
 kp9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
 :from:date:message-id:subject:to:cc;
 bh=7/8GIw2iyazt89FJIy7kQF7uh4bWo8/vjlTORMTFqAU=;
 b=E7CxDu/i3JCu4ZpacmA2pBQLFMH8gwg+87wQwdLV66I8QlrlvOowzHZNJ1b0VrD8R7
 tW9z2R08YPFtVoSj3U/22PtKhDJoy7MMI6ksuTRNLKUmY+cF0e2kJvCcuWvDWw42KfQF
 FjOCYZcAsWgajd+CnNRFHdsKkuD9zD/sQSltgNbDzH+518t9BG1wbjZGzoseIXasokZD
 8CO2Pfc8dM8P6lCQTXZU01OQKl1eDKWYGziOl3ippE3Za+CfojwDh04cmjW7S/okLGcD
 B21CFTKDz4u0vHLGDZHVp6pcx0k6U6UOxhZiCeqEWCkPhhwtuxQaeanEsk/wWgXmbAZT
 M0Mw==
X-Gm-Message-State: AOAM531vTTbluyfnSyRdX3cdCxXxCnY6wn5z+yLrqce7skCmQsVhi/ob
 65nXsYaPjEQKULGPKq5EEIPD/Z3tlODsgQEXYxqsjaMvNh5UlA==
X-Google-Smtp-Source: ABdhPJwxWmN1zpLtbFBn8zY2SpmJWm+IPSnstihKkv9IS4Ve0a+nGV0ioWRxx1F29EcL3VxHtEzJ0RqNlG83aNRQ+Jg=
X-Received: by 2002:a17:90b:180b:: with SMTP id
 lw11mr177471pjb.108.1636233629606; 
 Sat, 06 Nov 2021 14:20:29 -0700 (PDT)
MIME-Version: 1.0
References: <6b07934f-f0ce-5909-0595-3d50bc2a7c3a@chil.at>
 <1c7c517e-f0ee-8d02-75e1-5db2d92268f0@aaronmdjones.net>
 <04d29715-a3d5-59b4-11bc-5b2b932937a9@chil.at>
In-Reply-To: <04d29715-a3d5-59b4-11bc-5b2b932937a9@chil.at>
From: Jeffrey Walton <noloader@gmail.com>
Date: Sat, 6 Nov 2021 17:20:06 -0400
Message-ID: <CAH8yC8ngpm4R=owBvXSo6ZN34_BuZXG-odf_ybtmJHk8pBCCvg@mail.gmail.com>
Subject: Re: Android app: length of name
To: Christoph Loesch <wireguard-mail@chil.at>
Cc: Aaron Jones <me@aaronmdjones.net>,
 WireGuard mailing list <wireguard@lists.zx2c4.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Wed, 10 Nov 2021 00:53:39 +0000
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
Reply-To: noloader@gmail.com
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

On Sat, Nov 6, 2021 at 1:23 PM Christoph Loesch <wireguard-mail@chil.at> wrote:
> ...
> Oh, I didn't know that, thanks, that explains the limitation.
>
> Then I would suggest to note the limitation of 15 characters in the error message on config import, if possible.

I _think_ that may be this define:

$ grep -IR -E 'IFNAME|IF_NAME' /usr/include | grep -E 'LENGTH|SIZE'
/usr/include/net/if.h:#define IF_NAMESIZE       16
/usr/include/net/if.h:# define IFNAMSIZ IF_NAMESIZE

Jeff

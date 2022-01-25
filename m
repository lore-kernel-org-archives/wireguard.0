Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F9A1C433EF
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 25 Jan 2022 14:16:22 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 462a62b9;
	Tue, 25 Jan 2022 14:16:21 +0000 (UTC)
Received: from mail-io1-xd34.google.com (mail-io1-xd34.google.com
 [2607:f8b0:4864:20::d34])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 5728544b
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 25 Jan 2022 14:16:19 +0000 (UTC)
Received: by mail-io1-xd34.google.com with SMTP id e79so23787797iof.13
 for <wireguard@lists.zx2c4.com>; Tue, 25 Jan 2022 06:16:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to
 :content-transfer-encoding;
 bh=MO6unOocDdElILMLt3B48QC3juicDKysCZl5VqfqIFs=;
 b=c5wU8DV13iyN/xL/9DMhmogpqgvYhF9xxGLtvKj+eNTOPTJtyIsJts7bDR8KVKzQwv
 mt+M77tv7swIvpN4hRm1aiWjVaAbEqoqJpxMys27KHTFZbE/6gaUClTD6GZHz/RPK8gU
 kqOjjWe7fRhDT2NnVfivowrtJauqBbpNBIxY9HQuDj7VaDJ06HIYCMhR2z8qPTA1xfFc
 qYo0NqzhTaGojgUNFlq3BeTlijfJZMaQvdsPETdEcbYJP9ViX9PfrR3Q5Njc3QCPWfMp
 w8/VwOr9YTo1UlarRw7J4+bQbtO75oAVhEsm96vDNxbwYoN3EA2fmXQsIHieZ0hQeXbg
 Y8Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to
 :content-transfer-encoding;
 bh=MO6unOocDdElILMLt3B48QC3juicDKysCZl5VqfqIFs=;
 b=CXzQf7uM0nQWTPzn3dAqDTFeZYPn1bVvsgcO0S8yyukjkgx3sxa5bHP/l702QkStyL
 QRKJujhjHMScejNDpt6bNB3z30WApx4UHnZdqEQOCCG2bNdMqSvdZgTcQYMFZHdb08KK
 fd3FxznzXTw+l0mIaW8WzshWgZ7pMexuClOcOFLFFod0+0tFPQCRSiqk+Ftz3Cy/Gx2A
 mQErc4V0nVDTxeuGmKn6uD+oSbOuqt9jgvy7BQNBYdR5JIW61vS70vbqjpD1hLPUepZa
 Y3L6V3Htvy8Pu7Smsbuu4alY6r4EOfVjcaNKX2203QVDoQ4RYuILaKK64PfpcrQ8c5Q/
 8H6w==
X-Gm-Message-State: AOAM5303pf7iecWMl1rJGus7mTRMlZpmhdgZ7tnAx/bgDZ9sCIm2cP12
 AKrrdnCrQqoGUJeHI3sAF+JRcq2TQZtDXjY8/cCjbdkSBlw=
X-Google-Smtp-Source: ABdhPJxQPn0kttz6jyDOzLQ+wkbxtTblWKFeeUc1W/+bl/Ui21TwLTgyIEbtSaaO74VHaX5K91zAobA1RyF0iNWn02k=
X-Received: by 2002:a02:c4da:: with SMTP id h26mr1162435jaj.162.1643120177477; 
 Tue, 25 Jan 2022 06:16:17 -0800 (PST)
MIME-Version: 1.0
From: Alessio Nossa <alessio.nossa+list@gmail.com>
Date: Tue, 25 Jan 2022 15:16:06 +0100
Message-ID: <CAMTfdYou8TjP0TikezEjSWG-Rxtb8JzpPLcKOyOmE8B9sQpi8Q@mail.gmail.com>
Subject: Contributing to iOS app
To: wireguard@lists.zx2c4.com
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

Hello,
I=E2=80=99d like to contribute to wireguard-apple with Shortcuts integratio=
n
for the iOS app (this is a feature in the todo-list too).
The implementation is almost complete, I=E2=80=99d like to be allowed to me=
rge
my contribution with the main app (or to have information on how I can
submit my contributions).

Kind regards,
Alessio Nossa

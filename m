Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 714F5EE369E
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 12 Feb 2026 16:38:53 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id dfd07bef;
	Thu, 12 Feb 2026 16:38:51 +0000 (UTC)
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [2a00:1450:4864:20::22a])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id a76c5701
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 12 Feb 2026 16:38:49 +0000 (UTC)
Received: by mail-lj1-x22a.google.com with SMTP id
 38308e7fff4ca-3870cbd6c40so16597351fa.0
 for <wireguard@lists.zx2c4.com>; Thu, 12 Feb 2026 08:38:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770914329; cv=none;
 d=google.com; s=arc-20240605;
 b=YgUuub9sgWyPyTVmq9ff0rCNtVnJ7Z3FACxgb2TGqMN4XPeklrNQT8UxoYj4f1LkNM
 NcAlUNDxr0nB6QmFJo7R4yRAgdzN7hCcxf2gAoJlmu5e7v/qO3FzgZEGOZaEptGy9HLf
 K0eUtBF600zAygj406TRayPkm4p3kQUi4bJuUuXysItw8RYL8U4MskQlb6/XW20byCBP
 XDF2tUwl8APEGCBMYu/JVyhuTJmXd/GCwrj9snBBFEJPVl9KVs06QBtYETuK8SyYlMIP
 6kywsuIOV686f0bhECmd8vIZbTkyovtAIEmSeUeVxtAw9l9zUNSYjb/EFnMQo/s6SJdo
 7wfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=b8YDjyAldGhrnm6q8DEWdh6dZztf40oFx6GuSI0oY/o=;
 fh=5Gy6sD49DDFK9MfRmsheyidIprfWM5JqiUs9KXv8Y2Q=;
 b=iprBc/DH5ZWu7kfYnt8kYzdBM9Y8JMQLKJrFa7B48f7cCewBWk5KnJQTfPbPbdTWGS
 Fntzni27mO54FVOG1iZpDFTOfxg9wGOfTw5ctSvXczxnZDYSGFdCG4IlCrTaB1qEe3IU
 XrV7LdoQSKS4BTADsL1rT++ndVNNh/pxmS8B4Bsf0y46fR4HPWbOLb4N3SnA1XjivMg3
 sdKtTZt0UDWIJKAppChR9PUMcErXLIylbDL871XPOcJYDJd/QKWbVHI9FB62LqqDYweX
 CjA4zg7/vVcyN9BelX1d8IjwaVso4hBZAerxD9i66BR4V+O7qKZ23XOzj78v2QVHjEJc
 fYCQ==; darn=lists.zx2c4.com
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1770914329; x=1771519129; darn=lists.zx2c4.com;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=b8YDjyAldGhrnm6q8DEWdh6dZztf40oFx6GuSI0oY/o=;
 b=KKIvSlwrhNu47sXXU+VSPzAm3DizJslOufs08zYZwAY2ckYQkVNJAXw1JZfgptxAPk
 y/B/r7l7b3SySYlbLt/XNMykyQqMSVlgu7ASn6SLnHByyUCRc1oGwM3CWHfF4liu4XqL
 J4CKWQg43s7ktZcmP8+e2jfRrv56TP47BHMlXWmtbfJDUoMpCGGeOTQCDrxu6/gO00IW
 fatiE3p1PtSezD1FaaCzQss97IclyKjlaBTNDB5Vys7IqhEZBcHQuFb1VtH/2QCHknUb
 Ec+rjF7CXT5i7u/O49nBzQAK5P+E30PzLSrXr9jj3wH6YttFm7vIe05sgxSb9so2lxeg
 pPcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770914329; x=1771519129;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=b8YDjyAldGhrnm6q8DEWdh6dZztf40oFx6GuSI0oY/o=;
 b=cDww8iOa9X4UK/trw9RBlESb8TY/l5ar9DQr92lF7n1QDKlgni55ZGQJVNeH3Hs0vg
 QlfVvX0+6cVOCScm2Xy6RpSEZpTUDgSGPW2zGNE1zM7iucoYE3q2bSCdbjcDvqmnOblr
 rowptY0kKQE8XJp0T63uSr/L++Qg6oN2PKlSSEJL9yBQ9wWQTkCbodPSqJqYnik5YOoB
 pEpPSxP01tGTi6UBdEBctcYjtzPm+fW/XSdrbNnCrqHKxBY/RxD/RJDnkGdTj8VsrgDT
 Va6Kl4F0B7wp32c2N3/z085qeesvkI7g7u+1sexd8pcNci7p8JQpMFukye87hQoqRBna
 eBTw==
X-Gm-Message-State: AOJu0YwxayyZnDS8jmQKoMlxAcvWKrMG5Q70EN1M9mA+sbV7lq+U1Ntt
 VG0foS4hieSp3fqEPB59jXSQ8T3Uh5N2fHafn8htU8Bz5J5ArD2RsY5ZIHnKhhFMinZeGbQh1FE
 H5oTGM6wT2hPilcLaME747Y0BpRo5Bx0=
X-Gm-Gg: AZuq6aIVgyIqjtNWx+HEbi1renxBz3L7Cpq2NSgtQUYRoowZaDB8SLstQDBCKUGdYkv
 toTVXq92pytv958wdEyIiI9RqRvKg18Dlqf6g1WQ2+wimzURmtdyV1WjhUH3MOiHbMlLgMTsIom
 z2CoLNJJi8pVPKdSTXDxWq6/pAZ0c0K+GfBfDyCFG6fXaCQgfmJJNfsC+vCQYF0ZdRO+w2cWTCE
 LpzZcNmFC6hXI05FaepADJqdF0ADnz4Qs43ajnJUpgkf5fR44+zPZwa+OUpgLkNrUD8sX06/tHB
 rDflvR8=
X-Received: by 2002:a2e:b8cf:0:b0:383:2537:f121 with SMTP id
 38308e7fff4ca-38711012e80mr10801691fa.26.1770914328382; Thu, 12 Feb 2026
 08:38:48 -0800 (PST)
MIME-Version: 1.0
References: <CAApnxP0OicCUvxYo41sK8AnK=bxqR+qE2BTxFmE5cJbSyOJrBQ@mail.gmail.com>
 <CAApnxP1yjyM0ZjtHXHf8WHrsc0XtwbuwMfeSYPnZm_q19R26mA@mail.gmail.com>
 <8f88f226-031c-4aea-a71a-bf4a143b292b@amebis.si>
In-Reply-To: <8f88f226-031c-4aea-a71a-bf4a143b292b@amebis.si>
From: Oded Katz <katz.oded@gmail.com>
Date: Thu, 12 Feb 2026 08:38:37 -0800
X-Gm-Features: AZwV_Qh16Ay4nMeiXcFAevVH2B9HZ4ri4eW-XsZdg0aHxOnGMXRfvHKZrZ-jAOA
Message-ID: <CAApnxP0eN8268t-oSb4njvYu0SaRQN8nZEhkGb4umbUJAJQFuw@mail.gmail.com>
Subject: Re: Fwd: I want to report an issue I found with your example (send
 ring buffer get corrupted)
To: Simon Rozman <simon.rozman@amebis.si>
Cc: wireguard@lists.zx2c4.com
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

Thank you so much Simon,
I can try those changes myself and let you know if the issue got resolved.

again, thank you.
Oded

On Tue, Feb 10, 2026 at 9:49=E2=80=AFAM Simon Rozman <simon.rozman@amebis.s=
i> wrote:
>
> Hi, Oded!
>
> Reviewing your issue closely, I may have found the cause. I have queued
> a proposal to fix it here:
> https://git.zx2c4.com/wintun/commit/driver/wintun.c?id=3D8814f660310c30a9=
297fc640c844c4ab6f27e5d7
>
> However, I need to reinstall my testing environment to test and confirm
> it working.
>
> Lep pozdrav | Best regards,
> Simon Rozman
> Amebis, d. o. o., Kamnik
>
> On 4. 2. 2026 19.19, Oded Katz wrote:
> > Hi,
> >
> > I'm reposting this one as I didn't get any response.
> >
> > We were trying to integrate `wintun` into our product and while
> > testing we found an issue with upload of high UDP throughput on
> > multiple sockets. initially we thought it may be related to our
> > integration. but we managed to find the same issue in your example
> > code.we tried to do some debugging on the example, but it seems like
> > the corruption is on the driver side.
> > the way to reproduce this issue- run the example
> > - run the `send_udp.py` (the attached python script) on 2 different
> > command terminals
> >     - `send_udp.py 10.6.7.8 5201 1450`
> >     - `send_udp.py 10.6.7.8 5201 1400`after some time the
> > `WintunReceivePacket` returns NULL and `GetLastError()` return 13
> > (`ERROR_INVALID_DATA`)
> > many thanks,
> > and I hope you can help us.
> > btw: in the meantime, I'll try to see if I can contribute myself with a=
 fix
> > Oded
>

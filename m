Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E1EBEF06EA
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  8 Feb 2026 17:13:20 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1d18e308;
	Sun, 8 Feb 2026 17:10:24 +0000 (UTC)
Received: from mail-yw1-x1132.google.com (mail-yw1-x1132.google.com
 [2607:f8b0:4864:20::1132])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 36406e9a
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Wed, 1 Oct 2025 03:59:22 +0000 (UTC)
Received: by mail-yw1-x1132.google.com with SMTP id
 00721157ae682-71d60528734so75733367b3.2
 for <wireguard@lists.zx2c4.com>; Tue, 30 Sep 2025 20:59:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1759291161; x=1759895961; darn=lists.zx2c4.com;
 h=content-transfer-encoding:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xoVAUmokAZIXa1hM4YA6q0+OYwIzvQ5Iv22MFL/3LDU=;
 b=NUhl4hCIfK+rN/GX2ZOktZ9b8CBHLbDe73oSOTCBSOgNoKvIBoI8m2x8qxqeZ07Qv6
 ZouVjUP0f+ob/f6HntJ24ZRqGT9MwYWuY/sexK0nZWXLiiVyr4bHbxQ3l03Vl3HtXW+e
 dxrxX97tGpZXm1iLeJxwEPMT9oaj5KwwB8AeisUsHjstoMVyLkKVQOEM5h+Y10+mzfGY
 sCJRQPSbFlIAoAqNfWDkIyLJeuRECD4wNJfgprI28KgWQaXU6dBb32CwOv2TNrd6O1lk
 byKAEF/txVoeq6aysrPbRo2oi9oeHB3WoKQKl8Y0uiF3PoyEuz9BlEkzAKowtqNAIrsP
 wx4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759291161; x=1759895961;
 h=content-transfer-encoding:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xoVAUmokAZIXa1hM4YA6q0+OYwIzvQ5Iv22MFL/3LDU=;
 b=Nhn9IPkkalsdZlRZljZy6BPBmTWw5vYtgyjHYLsrStXHD8NLQjCbgg7bOdmyts6meZ
 wIp4HymcSYk+eli4qk2kqVkkWOK3S5486zbpmR0TOyjekURZQtyCtpWDgQHFdRvnjmIT
 cCRr/mCuKuLK7c0FUIFcg3uPXAVx2shxy2ZjqEwFe7F4NvolWoXUc6JElMM0T5rlU+xH
 tnZub/6ZdqZ9nVzLEpA6Mk+JoY667r30semdUCX3mn+HSqR7VFwXbdaNMHIvP4cc6xiY
 n6+RLTnZ/BlS+wOaCzIVrJTAYjDFrpcbYv7BeGZPxE3pPKt5XzSeOxk6q+JHEWUH7R0M
 nmtw==
X-Gm-Message-State: AOJu0Yzp/F/R7x/sHzCBjLonnc9MKAmU83B7OEjUyZHQQLbkxLEOWU7U
 /l7i+lHpe+FccMqPgEHHao/tB4b0HRJRzbRfwrVnim7n1kWPyJOUCLj3cp5Z4oTCz+d7pB6shkl
 OtTE89FAxTAgibXYDUWOx3aqQ2rw5jU2NFRnb
X-Gm-Gg: ASbGncvUEiu7HQWVSqHnRXZ0+HJQ0SOWiwerL6VVzb19CUjPx+n7Wb+lBhsx2lqIvbR
 ffAtQBB+ZWBxNPXqKWauGPBXiIeHCXbxdhf1Iy/og/keI7CsQEWzXEXlLsbgDeSbQoGYOyYzrmw
 nyCWh/TqGJL7ZYHXcN4PHAC9huTM6zLnCp6GOF5+oLsYartbCwP51DeDIui7NSVPNbRfxaKnM5b
 baAKZZfvXg+jn12pW3R1JpxyykcMJbLkzgapqpJH8wutGHIMohpVyGLgQInN3c=
X-Google-Smtp-Source: AGHT+IGLgDocFCj+LYXKsIuzzQfHIkUrN+ccNgRIQ7pWT99m3fDTuDjSblj9YcTX7V69vawJ1BY0QtOt6+SCLeOlKIQ=
X-Received: by 2002:a53:ea42:0:b0:635:4ece:240e with SMTP id
 956f58d0204a3-63b6ff995acmr2230270d50.46.1759291161062; Tue, 30 Sep 2025
 20:59:21 -0700 (PDT)
MIME-Version: 1.0
References: <CAFj3jpb7F4dwGHTu=vcfEq47uGz57jJxvAkw7SihCW-ko8-Pag@mail.gmail.com>
 <CAFj3jpbyDTOejonUj9P27eKOCvsWt+9Nx4HhbU5usBWWPLzrmg@mail.gmail.com>
In-Reply-To: <CAFj3jpbyDTOejonUj9P27eKOCvsWt+9Nx4HhbU5usBWWPLzrmg@mail.gmail.com>
From: Joey Officer <jofficer@gmail.com>
Date: Tue, 30 Sep 2025 22:59:10 -0500
X-Gm-Features: AS18NWD7KLej-O0LPTVRY5vMXCG4ksOqIpVfY7G0XrhS2C5d2Me0ytj4_0DmEFw
Message-ID: <CAFj3jpb0DnshKSMOaA6XTKshCrQUT7BhOwr3u=WyDoXBJiAwQA@mail.gmail.com>
Subject: Fwd: Wireguard for Windows - NCO elevation
To: wireguard@lists.zx2c4.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Sun, 08 Feb 2026 17:10:11 +0000
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

We=E2=80=99re using WireGuard for Windows with LimitedOperatorUI enabled an=
d
standard users granted to the local Network Configuration Operators
group. Intermittently, often after sleep or a restart and if a tunnel
was active, we get:
=E2=80=9CWireGuard may only be used by users who are a member of the Builti=
n
Administrators group.=E2=80=9D

Environment:
* WireGuard for Windows: 0.5.3 - master (downloaded from official site)
* Windows: both Windows 10 & 11 (Fast Startup: off - as best I can determin=
e)
* Users in NCO: Assigned via policy from Intune
* UI startup: manual

I traced the check to TokenIsElevatedOrElevatable, which only
authorizes when the token is elevated + admin, or a linked elevated
admin token exists. This seems to preclude Limited-Operator use unless
the user is also an admin.

Proposed change: when LimitedOperatorUI is enabled, explicitly allow
tokens that are members of NCO (without requiring elevation)

Diagnostics (when the rejection happens):
* IsElevated(): false
* NCO SID present in TokenGroups: I believe this is true, based on the
results of whoami on Windows returning NCO membership.  I've written
(today) a debug tool to report tokens when this fails again.

Workaround that consistently helps:

As admin or with remote management software : stop  WireGuard Tunnel:
${name} service
then have the user log out/in (new access token minted). We typically
tell the user to ensure they are using user/pass versus re-entering
their PIN on login

Does the above approach align with the intended Limited-Operator
design? If so, I=E2=80=99m happy to clean up a proper patch + tests; if not=
,
where should the NCO allowance be wired in? Any guidance on the
preferred place to gate Limited-Operator UI would be appreciated.

Respectfully,
Joey

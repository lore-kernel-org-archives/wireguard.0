Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21730C433F5
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 17 Apr 2022 08:24:20 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id e9a32209;
	Sun, 17 Apr 2022 08:22:38 +0000 (UTC)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.130])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id f4e21f99
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sun, 17 Apr 2022 08:22:36 +0000 (UTC)
Received: from [192.168.177.41] ([94.31.101.241]) by mrelayeu.kundenserver.de
 (mreue010 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1N6KpF-1nzMcX1zXF-016dVx
 for <wireguard@lists.zx2c4.com>; Sun, 17 Apr 2022 10:22:36 +0200
From: "Hendrik Friedel" <hendrik@friedels.name>
To: wireguard@lists.zx2c4.com
Subject: Better Output
Date: Sun, 17 Apr 2022 08:22:32 +0000
Message-Id: <em19dde1c0-bcda-4ad2-b3ce-d72fb64993e4@envy>
User-Agent: eM_Client/8.2.1659.0
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:JcwPo3t/Hb7lxlZXFS0zVZfIo2ELD8t1jIvQ4mE0vB95kN7bPxh
 1rkdplfJGdQp+/l8IUh3HW9PLRNwzkLnfKwDJBYOafuFwtE0XaxuF9ig3snheECBMLNKj+w
 kWaWvUtYVQtKQQXBb5U4gCHOla3pJbd5sLJ6bxoj6jLgPuDypouggUuOS1fc3HtSIn8sZbd
 W2iUl5uEtM8gG0CL22/4A==
X-UI-Out-Filterresults: notjunk:1;V03:K0:CyZuLy5FLDY=:bvjo5fdw1KGILumjAOxAlr
 kZtUUwdHQtBQuILNlIb3yNeOyhe4sCXAKHvefCn8k9nf7S1r3JF2/B2xcbq6a8y8JrMCsS66d
 7UOLB+BQsFrlVx+hmdkKDguaawC55gbRA/j5K5lAZbIV/GgVIuS99T3lA9vw5R5M3XICVkDvS
 Wku81JwBYSgGFaUaaf+pUeWc1LJjq9GDCIDgsLU5Ylxc8zsD6fw1C4bkDzk4lqWITLtrFdGne
 iFsGFEeMpj+7snDjepSlk/ui3FSd/FUp5NIZn2uxed8yZMt6j8gBOJTENRHjqhr4e9vCl8n00
 w+/SQiadvZHt6AzrzZaTHAe7qK3BDCtWBl2DKQwQKgQtopq10j8ssD6mbR/7LViZQVopYuLGX
 af5s6J0uZTbvCiYIWm6x8HeJtfBOM6Q1hp927MTi2YsWBTVsh865Li4/3i+KX4AMyOxKX9tQm
 ipipr/QeyLJLc0aUG/iJ8ayjbfQzmJNah5rDLZTea721HVE6wyl0BJkypxOjMm6Z6wB6iiTsZ
 5yNNMMfpXYM6fomEqLEdEjN8PCjeK6MGnrisFrZ7vbfuRmatWMNsNKEKDpQZsN6xybm4aS0R9
 kptr8zlHLulST1hH0Z1nPwUOv80E6Lk1iuPLd1Y7anxs71PryXkGo2YL+9xx0o/Sx0ZPBeufO
 fuW+77b2AJIyOm0yzZP4aFdF0FkyTcyQBMI26O8Z0WD1qPiQDvoQvBExDGO427et5C2KXIeoO
 dzeqkjt6INOBEW+e
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
Reply-To: Hendrik Friedel <hendrik@friedels.name>
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

Hello,

when using wireguard - both Android and Windows - clients, I in the past=20
often thought that the connection is fine but in fact, I had a wrong=20
Key.
The Windows-Client showed a green Checkmark under Status. The Android=20
Client showed the "key" symbol and it showed also the "switch" on the=20
right hand side (=3Dactiv) and blue.
Obviously, the connection was not working, but I would have hoped that=20
Wireguard would have told me, that the connection was not ok.
In fact, I was only able to determine whether the connection was working=20
by trying to access some Service (e.g. google) or by observing the=20
"Received/bytes" counter which remained at 0.

I would suggest an improvement here:
1) If no Server responds on the particular domain/IP, wireguard should=20
show a message
     Could not connect to [my.domain.com] under IP=20
[2a00:1234:1234:c700:ba27:ebff:fe3e:2342] or 1.4.4.1.
2) If a wireguard server responds, but the key is not valid it should=20
show a message
     Connection failed. Host responded, but key was invalid
3) If the connection fails, the Windows Client should show a RED symbol=20
under status.
4) If the connection fails, the "key" symbol should not be shown under=20
Android and the toggle-switch should move from right&blue (active) back=20
to left&grey.

Would that be possible?

Greetings,
Hendrik


Return-Path: <SRS0=x2E1=EQ=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC8B6C388F7
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 10 Nov 2020 13:03:16 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1A814207BB
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 10 Nov 2020 13:03:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=web.de header.i=@web.de header.b="ARsCNTIT"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1A814207BB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=web.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id fb1ae381;
	Tue, 10 Nov 2020 12:59:02 +0000 (UTC)
Received: from mout.web.de (mout.web.de [212.227.15.14])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 265ba460
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Wed, 4 Nov 2020 23:11:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1604531688;
 bh=KPyRj+j/+XNk1miOqr824xI5ShwuOpGNyz6KlwhS1ro=;
 h=X-UI-Sender-Class:From:Subject:To:Date;
 b=ARsCNTITgjH3FM3W3wRajJWQ8sZiCX8CYfDqxmFe1GpxA8FxDRzfujUFgqm/u/7p7
 AR9oLlUHmAwOjgRQg2B4F8FJ4CtzPyWgJ266gBAQ8R0E6EVi9ApVaDT1TlG7IvDbQJ
 SRR1IUOtw7ZsoUi0YSPexp1jrpucPo64u7GW/j7Y=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.10.34] ([77.21.177.107]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1N7xeZ-1kDmX52tD1-014t6r for
 <wireguard@lists.zx2c4.com>; Thu, 05 Nov 2020 00:14:48 +0100
From: Stefan Puch <s.puch@web.de>
Subject: Actual plans for Windows client: PostUp/PreDown possible?
To: wireguard@lists.zx2c4.com
Autocrypt: addr=s.puch@web.de; prefer-encrypt=mutual; keydata=
 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
Message-ID: <b2a38e9f-9e79-b821-b80c-4cff284f8f6b@web.de>
Date: Thu, 5 Nov 2020 00:14:47 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: de-DE
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:5RF0Bt54a5Ark/GpD4V0GmraU0ylmYH/bPkz4ymSQEfLB1BljYU
 sVFUbI7mXvGktmNViCaYGm58G283ETJ9bf7ah3n6USj5bLFRyrh/9qzKgI2fWlnc0WNrlmC
 ciWfGvja7SHmlTVYfxpNehfJQvJ+j+okN1o5cQQHrwdrtgFO2ls+Hi30Wq5htppCVpa2KC2
 Qv7IR8CXWHv7kjMoMLqag==
X-UI-Out-Filterresults: notjunk:1;V03:K0:SEO0yvFGZ5w=:NG3wHn+y3q3+yy8e9W9GeK
 lf/oluX+dsCK3+jqJDY5t418f2Ao9qz0/lM9hFC6cHtEILRmOU0dNFpZv/a1YfZQMlYckYpKy
 GxAR3NSrmGZRrQZNlkwhQ4S1fi1NB9gCmDh15R1iM7UayyNDv1zdMKPtt8G3Q8ci60WB75Jok
 lDDhBp0M8yyzgMIQ/x6Uuq2aZKMHyN4P/MXbMWP+2GfbyylWrUuN0aMEZa2VXUQYvoDuhBx+9
 vKp0bLS4A3c/ulCjYiqzZ6dhXvy0L/x2/t4fJOk9NOIXM4v3kpdnQ2HOJo54Kd45dnvmGmqv0
 gcVpQmzD95O9iPdoiJkFGjVlLDXJhhGj/I4hK5V46zLEarEAn3I89TUc9oioX0x+UNEZ2Sx2x
 sbj/oBvSjuZvF+8OHcr4Ur3U2/Cb4iftnrfePu3cObkBkLx1FMeY06j8Qt3Kmgz1utVDhyoHB
 QFAtMjVfdwbDrzlkk4gPqwKwbrfwbmMnllIPz2IO0gZsf0gS0kDt7ppfXQb4pKanJ3LvWZ8ZZ
 q4Z7zIj+B9w9KhyF5NMt8VW9HUJ/ttNkbf4+d0U9Rmhv0Ec6D9Kcml80UwjVjv8gHG/RWyajf
 H4h0yNRSFlJdB+MfdvshrjcyxpUMOayZdeLWiYbmpioIDzXknz1/WPq1qgg/ozaX+43R57Ucz
 +8J7BVVQZTqKatHja5/ou+tvwLRr5JbzBVgd+Xy7ApfL0c9isvs7qwf30aopxtjfdhEqdKB78
 i8EynZVFJrfDhjX6bpwvjDoAGNx0hi2ICX1WNIxRI5VrKjD0bE6ThlO1/BawDvC8wf9x6pz88
 sFg5kBVNZ/ItnaK0gnG0truX5BzCayAO8zP9Klou1t9vRFvea9e49S0/5UcgOzn5vQJUSdGb+
 mb3p8onArG0+V2Cvx4HA==
X-Mailman-Approved-At: Tue, 10 Nov 2020 13:58:56 +0100
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

Hello!

I=E2=80=99d like to raise the question regarding an option for PostUp/PreD=
own with the
Windows client again, which was (to my research) first discussed here on t=
he
mailing list at the beginning of December 2019 by R=C3=A9mi and Jason A.

I thought about switching our OpenVPN setup to the modern Wireguard and st=
arted
reading if all my requirements could be fulfilled. So far I have some user=
s with
no administrative privileges on their Windows computer when they want to c=
onnect
to a remote server in order to access some shared space (Samba filesystem)=
.
Currently the users are using OpenVPN, which has a background service runn=
ing
with admin rights (Windows service). Thus the users can simply use a short=
cut on
the desktop to the OpenVPN-GUI including an appropriate config-file to con=
nect
to the remote server. After the tunnel is established OpenVPN uses the
(optional) solution to place a batch file within the userspace
(%USERPROFILE%\OpenVPN\config) as CONFIG-NAME_up.bat / CONFIG-NAME_down.ba=
t
where some stuff can be placed to mount a Samba filesystem after the conne=
cting
and tunnel are established (net use z: \\10.0.0.1\data) and to unmount bef=
ore
the tunnel is disconnected.

I=E2=80=99ve seen the concerns from Jason A. about spreading malware and t=
he hint that
=E2=80=9CLinux command line users can generally be trusted to check the co=
nfig files
they're writing into /etc/wireguard=E2=80=9D. From my point of view the sa=
me holds with
the solution provided from OpenVPN to use the batch files, which are optio=
nal,
can be checked by the user and have to be explicitly defined for each VPN =
profile.

Looking into the Windows specific todo list on the Wireguard homepage I di=
dn=E2=80=99t
find any comments if this will be considered for later versions of the win=
dows
client, if there will or won=E2=80=99t be a solution like this.

Maybe I have missed something, so my question would be, if someone can tel=
l me
something about the current status or a possible implementation?

Kind regards
Stefan

Return-Path: <SRS0=n59I=76=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 737FCC433DF
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 17 Jun 2020 07:41:58 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1406E21501
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 17 Jun 2020 07:41:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=with.parts header.i=@with.parts header.b="OIZylgk/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1406E21501
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=with.parts
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 755e9e42;
	Wed, 17 Jun 2020 07:23:26 +0000 (UTC)
Received: from mail.with.parts (mail.with.parts [104.37.195.247])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id b51aa105
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 11 Jun 2020 17:32:13 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with adasauce@with.parts
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=with.parts; s=dkim;
 t=1591897773;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=7ZWOTHGVfR08R/WTlI2+qHdFK55M4Twjr+f8YiG2k0k=;
 b=OIZylgk//d5Fyge0EhdR+nakHwUjcJeiir1F4H2xAqBFC8RgzhnQVnfqQZWhgq38q58Lqf
 KoPf4SQOQVGAf5LGAi82Svu3/5rG1oUsjobHhOmBK1iBBGw7wToTzCkcL5wOMla+lScbVV
 NIOckVq3/YKwwM3PiF0JjdtEsoSxRsXb1CtGgoPVICzx/yiSW2+gZRfIsmT0nUj85kQEwJ
 M/n+p9PGN4NIx/fM7BaRv4mxqWO8p+xuBX0fH+WZnym6lDC6sIL6b0EdJxPujKl3fH5iDY
 QsyiCRA9GaYglzjrttpY/0T0tDP2kn/kH0flS7Rw8SJ6LSXOqYJKsmxtbsmsjg==
From: "Ada Sauce" <adasauce@with.parts>
To: wireguard@lists.zx2c4.com
User-Agent: SOGoMail 4.1.1
MIME-Version: 1.0
Date: Thu, 11 Jun 2020 14:49:32 -0300
Subject: =?utf-8?q?Re=3A?= Ubuntu =?utf-8?q?18=2E04?= kernel 
 =?utf-8?q?4=2E15=2E0-106-generic?= breaks 
 =?utf-8?q?wireguard-1=2E0=2E20200520?=
Message-ID: <44-5ee26e80-1-1574d920@168130073>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=with.parts;
 s=dkim; t=1591897773;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=7ZWOTHGVfR08R/WTlI2+qHdFK55M4Twjr+f8YiG2k0k=;
 b=gzbtDYgl0JohTRWUIfc3t476/gys3hfvbA1uNTO6RgAfzR+Ke3Kpvp/cPc8GhBzOaGg92u
 KvYGu4gCnfOcK9QFJnipLrfVuEc9T37W24OIfhV4q8CdcF7xg+ekSiLfqhMg/0GCiT7HGy
 PBtwSJNWs+PPHCIWby7X5p+/K2iJD1v1keLz/A2PEQEZuYU0QqcvOBoliu5AuzyvMbK1AE
 UWEu8EX/X/WTdiBX45Rb0R2Tr1kay7glI59TtvJ0lubTxHqK0JK6oc0Y4o0FUtVmi8w9nN
 Eqs5NwB9qwhKHulkpwNTYfbSFxxyET95plYA3hxMpKbf7fdee/29UWUBPeupFA==
ARC-Seal: i=1; s=dkim; d=with.parts; t=1591897773; a=rsa-sha256; cv=none;
 b=lVrBCAck+S8mplsjOSqrCIQ7Czbb0v55Zl1OA9DwzMYCoyWm6K+uzjZsANuYrEQ4d5IRdu
 R31iUDx2On0icAKfluKrtu/j34aQpYL6p574nj0EZDX7jElD89RrbMXLlg7UmY6R6OMQ30
 tsgOSBsX1DwOPimhlAF6cE0Pr8KCELDPIW6esiQSZGcn59RJRTnSz0nqsI31bVnEgF2+SL
 crR7WJGL88KYFGnNURQPta3m8b5IVglDFbuoCk+rY8o87F4OcA7YiGabXXdEIeANVK5LSO
 oc8a2AavgNEcJd8tXQNQMKkRD2KmuFxZmV+yjMasauCYF7b0F2op+Rifk/ZH9w==
ARC-Authentication-Results: i=1; mail.with.parts;
 auth=pass smtp.mailfrom=adasauce@with.parts
X-Mailman-Approved-At: Wed, 17 Jun 2020 09:23:25 +0200
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

I'm now also observing the same failure mode as Martin.

However, the kernel is 4.15.0-101-generic.

```
/var/lib/dkms/wireguard/1.0.20200611/build/socket.c: In function =E2=80=
=98send6=E2=80=99:
/var/lib/dkms/wireguard/1.0.20200611/build/socket.c:139:20: error: =E2=80=
=98const struct ipv6=5Fstub=E2=80=99 has no member named =E2=80=98ipv6=5F=
dst=5Flookup=5Fflow=E2=80=99; did you mean =E2=80=98ipv6=5Fdst=5Flookup=
=E2=80=99?
   dst =3D ipv6=5Fstub->ipv6=5Fdst=5Flookup=5Fflow(sock=5Fnet(sock), so=
ck, &fl,
                    ^~~~~~~~~~~~~~~~~~~~
                    ipv6=5Fdst=5Flookup
scripts/Makefile.build:330: recipe for target '/var/lib/dkms/wireguard/=
1.0.20200611/build/socket.o' failed
make[1]: *** [/var/lib/dkms/wireguard/1.0.20200611/build/socket.o] Erro=
r 1
make[1]: *** Waiting for unfinished jobs....
Makefile:1577: recipe for target '=5Fmodule=5F/var/lib/dkms/wireguard/1=
.0.20200611/build' failed
make: *** [=5Fmodule=5F/var/lib/dkms/wireguard/1.0.20200611/build] Erro=
r 2
make: Leaving directory '/usr/src/linux-headers-4.15.0-101-generic'
```

Cheers, Ada


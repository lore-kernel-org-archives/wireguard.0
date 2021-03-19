Return-Path: <SRS0=a6UP=IR=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06E15C433E6
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 19 Mar 2021 14:06:48 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6652864DE8
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 19 Mar 2021 14:06:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6652864DE8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=evilham.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6c037e25;
	Fri, 19 Mar 2021 14:04:35 +0000 (UTC)
Received: from yggdrasil.evilham.com (yggdrasil.evilham.com
 [2a02:2770::216:3eff:fee1:cf9])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id ed2ad102
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 19 Mar 2021 10:43:22 +0000 (UTC)
Received: from yggdrasil.evilham.com (localhost [IPv6:::1])
 by yggdrasil.evilham.com (Postfix) with ESMTP id 4F20qF20lGzHrf;
 Fri, 19 Mar 2021 11:43:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=evilham.com; h=from:to:cc
 :subject:references:in-reply-to:date:message-id:mime-version
 :content-type:content-transfer-encoding; s=mail; bh=ka3N9SKhV0Zn
 Mpyq9STNXBwWdm8=; b=ZBmSVnYnfLzUSqWfP7QZQSylJj/8qVoBJ/pFrL3EtBf6
 dz1qui7G3usNp1IbWBAhxYwsXWa/j2LqxomTzHBZMluUXXcZ/sXp5sH0oQmQ4CeI
 BC6daLxzGCzaddNGDqy6ILAEec0SD/ZvYaJY+rlQXFOjxsyzJwEKmqfRBcQqpkA=
Received: from yggdrasil.evilham.com (unknown [IPv6:2a0a:e5c1:121:1::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by yggdrasil.evilham.com (Postfix) with ESMTPSA id 4F20qD3VtlzHrd;
 Fri, 19 Mar 2021 11:43:20 +0100 (CET)
From: Evilham <contact@evilham.com>
To: wireguard@lists.zx2c4.com
Cc: freebsd-arch@freebsd.org, FreeBSD Hackers <freebsd-hackers@freebsd.org>
Subject: Re: Removing WireGuard Support From FreeBSD Base
References: <CACNAnaHR9Li0wPOjmwRk7jG76-AESoTt0QrrG_UVTrev38N=bQ@mail.gmail.com>
 <YFH7yIJ9OImHUwYO@lion.0xfce3.net>
 <CAHmME9pqVfzWVsuTrC2eovbWTVeTSX086ZM6DSOK1ejPjkV3uQ@mail.gmail.com>
 <YFRXBzdglrzB18Ic@lion.0xfce3.net>
In-reply-to: <YFRXBzdglrzB18Ic@lion.0xfce3.net>
Date: Fri, 19 Mar 2021 11:43:19 +0100
Message-ID: <5980672e-2c67-4c46-9e31-733515d70a41@yggdrasil.evilham.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Fri, 19 Mar 2021 14:04:34 +0000
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


On dv., mar=C3=A7 19 2021, Gordon Bergling wrote:

> On Wed, Mar 17, 2021 at 12:34:02PM -0600, Jason A. Donenfeld=20
> wrote:
>> Hi Gordon,
>>
>> On Wed, Mar 17, 2021 at 6:53 AM Gordon Bergling=20
>> <gbe@freebsd.org> wrote:
>> > I am not sure, if the removal is a great idea, a removal from
>> > releng/13 and stable/13 - possibly yes, but from main?
>> >
>> > This is still -CURRENT and -CURRENT should be central place=20
>> > for development,
>> > even if we have phabricator for review.
>>
>> It looks like Kyle has gone ahead with the revert anyway, so
>> development is now happening at:
>>
>> https://git.zx2c4.com/wireguard-freebsd/
>>
>> And there are now regular snapshot releases:
>>
>> https://lists.zx2c4.com/pipermail/wireguard/2021-March/006518.html
>>
>> As for your objections, and the question of what -CURRENT=20
>> should or
>> shouldn't be used for, I really have no idea as a community=20
>> outsider.
>> But I do look forward to submitting it for proper inclusion in
>> -CURRENT after a few more cycles of development and refinement.
>> There's also the crypto question that I'd welcome some feedback=20
>> on:
>>
>> https://lists.freebsd.org/pipermail/freebsd-hackers/2021-March/057076.ht=
ml
>>
>> > If the complete backout is happening, please don't forget the=20
>> > manual
>> > page. I have spend a lot of time on it, while OpenBSD made a=20
>> > good
>> > template.
>>
>> Thanks for bringing this up; I had actually forgotten about=20
>> that. Do
>> you want to re-add it and keep that current as we develop? If=20
>> you
>> email me your SSH key, you can just commit it directly.
>>
>> Jason
>
> Thanks for the reply. I still think that the removal from main=20
> was a mistake,
> but it has happened.
>
> I'll create a port for WireGuard tomorrow so that FreeBSD isn't=20
> losing WireGuard
> support at all, for whatever reason.
>
> --Gordon


If you do that, please take following tiny patch into account=20
(missing from the git repo @zx2c4, posted to the WG ML awaiting=20
moderation):

This is due to the removal commit form stable/13 and, from what I=20
saw, didn't affect CURRENT or 12.

---
 src/compat.h | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/src/compat.h b/src/compat.h
index 6126e26..bc29c01 100644
--- a/src/compat.h
+++ b/src/compat.h
@@ -7,6 +7,9 @@
  */

 #include <sys/param.h>
+#if __FreeBSD_version < 1400000
+#include <sys/smp.h>
+#include <sys/gtaskqueue.h>
 #if __FreeBSD_version < 1300000
 #define VIMAGE

@@ -18,8 +21,6 @@
 #include <sys/malloc.h>
 #include <sys/proc.h>
 #include <sys/lock.h>
-#include <sys/smp.h>
-#include <sys/gtaskqueue.h>
 #include <sys/socketvar.h>
 #include <sys/protosw.h>
 #include <net/vnet.h>
@@ -39,6 +40,7 @@

 #undef atomic_load_ptr
 #define atomic_load_ptr(p) (*(volatile __typeof(*p) *)(p))
+#endif /* __FreeBSD_version < 1300000 */

 struct taskqgroup_cpu {
 	LIST_HEAD(, grouptask)	tgc_tasks;
@@ -67,7 +69,7 @@ static inline void taskqgroup_drain_all(struct=20
taskqgroup *tqg)
 		gtaskqueue_drain_all(q);
 	}
 }
-#endif
+#endif /* __FreeBSD_version < 1400000 */

 #if __FreeBSD_version < 1202000
 static inline uint32_t arc4random_uniform(uint32_t bound)
--
2.30.1

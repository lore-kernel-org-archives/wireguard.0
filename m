Return-Path: <SRS0=BAVD=EY=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D45DC56202
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 18 Nov 2020 00:43:17 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8A37C2151B
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 18 Nov 2020 00:43:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="vtdm7dIC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8A37C2151B
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 543b32d9;
	Wed, 18 Nov 2020 00:38:07 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 1529c7ad
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 18 Nov 2020 00:38:04 +0000 (UTC)
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 76d7478d
 for <wireguard@lists.zx2c4.com>;
 Wed, 18 Nov 2020 00:38:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :in-reply-to:references:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=5EeQc0bXnVV+i7fcZ2dQkUE2+Ag=; b=vtdm7d
 ICvbpqBiDDxpDeHcDfwyoVIDAmE2BglIo2NzYPa4Td3RleVFv+O2ugkb9ZdQJJ21
 PJhBlZmOIuGt30K0Nz348oXcS3pbhHEHVQf/izt7Et2Wrf8+Vqkhrz2L9LVBWMwd
 tN/UcKJ4/mIkukfWILRxlhJLSnysuKbXzMACc9l5322WEeMM7h103y9CG9Db15Wz
 Qc/gWvYNLAZo0DdiopU+kgq5JgcKdikb3zQ5yR41bllxnI0MbOFj0k8P9qoNw03/
 pd9BRYj63NXcJ1elLviGNO3dWxZutTGRUB7S8vdjwTF70arI6gcKJJ352ORwfJ/0
 /TK/1+ZbmmWeehgg==
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 62ad16a5
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 18 Nov 2020 00:38:50 +0000 (UTC)
Received: by mail-yb1-f181.google.com with SMTP id g15so36427ybq.6
 for <wireguard@lists.zx2c4.com>; Tue, 17 Nov 2020 16:42:44 -0800 (PST)
X-Gm-Message-State: AOAM531hYN0YjqQ+h58AYzCP6Id7Bfu3kRjfhHCRXH57rg7/OEbfkApa
 A3CyrMoVG1Fon1rs5ZIkxYMv9gW41hQdF8w6rAk=
X-Google-Smtp-Source: ABdhPJwvG41ILZl60/fWi5ENzikrZt+88lUWleSVJY9zTJn6Lh6yTL+bNO71H8mvhMhvBErK/pmUz8UgjbbtnFBNNlM=
X-Received: by 2002:a25:4943:: with SMTP id w64mr2591473yba.178.1605660164405; 
 Tue, 17 Nov 2020 16:42:44 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a05:7110:474a:b029:2b:bd99:a3dd with HTTP; Tue, 17 Nov 2020
 16:42:44 -0800 (PST)
In-Reply-To: <CAHmME9qvj67wkqya20rq9ru4HEQeB=hjLYEp+Djs5ct0CV4SkA@mail.gmail.com>
References: <CALaUSuvDgxsr99R2qiOrXM20btnvnaiyAx7197jfcTauOt5CTA@mail.gmail.com>
 <CAHmME9oeZc7cruN2fayu+F+8BO0RiwGuA+dqzQRr5spnvhY6GA@mail.gmail.com>
 <CALaUSuuzQhTcDE_b6PPf=fXuOjbmVf7Tgzdz9DbWMxCJ8-2WUQ@mail.gmail.com>
 <CAHmME9oZvNQjCoShdMTQ2n0soTA0wNVVm9rPFcma0fP-6_9tsw@mail.gmail.com>
 <CALaUSuupA5bzEMb-NLRXVGy0n_nDWLoVVaDnU11e2iWmOO1RMw@mail.gmail.com>
 <CAHmME9qvj67wkqya20rq9ru4HEQeB=hjLYEp+Djs5ct0CV4SkA@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Wed, 18 Nov 2020 01:42:44 +0100
X-Gmail-Original-Message-ID: <CAHmME9q74TPPdOhrL67Zj23_8VxA75-ztd5VMGqyAob8XuD_TQ@mail.gmail.com>
Message-ID: <CAHmME9q74TPPdOhrL67Zj23_8VxA75-ztd5VMGqyAob8XuD_TQ@mail.gmail.com>
Subject: Re: WireGuard for Windows failed to start after update to v0.2.1
To: Joshua Sjoding <joshua.sjoding@scjalliance.com>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
Content-Type: text/plain; charset="UTF-8"
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

On 11/18/20, Jason A. Donenfeld <Jason@zx2c4.com> wrote:
> On 11/17/20, Joshua Sjoding <joshua.sjoding@scjalliance.com> wrote:
>> Here's a more complete view of what happened:
>>
>> 1. I heard reports of two of our users having issues updating
>> WireGuard this morning. Their issue was a firewall warning (now
>> hopefully resolved in a separate thread).
>> 2. I decided to try updating WireGuard on my own laptop to see if I
>> got the same behavior.
>> 3. I opened the WireGuard UI through the icon in the system
>> notification area and saw that WireGuard was offering me an update.
>> 4. I told Wireguard to update and it started to go through the usual
>> update process.
>> 5. The WireGuard UI closed and the icon in the system notification
>> area disappeared, which is typical as it does an update.
>> 6. The WireGuard UI never came back and the tunnel never came back up.
>> There were no error messages, just silent failure.
>> 7. I checked the Windows application log and saw the error messages
>> listed earlier. In particular this message seemed pertinent: "Product:
>> WireGuard -- Wintun error: Unable to remove existing driver: The
>> system cannot find the file specified. (Code 0x00000002)"
>> 8. I compared my experience with the other two cases and determined
>> that mine was different. I started this thread and another on the
>> WireGuard mailing list to address the issues.
>> 9. I had some tea. I love tea. Tea is wonderful.
>> 10. I manually started the WireGuard desktop app. It immediately
>> prompted for elevated privileges, which is atypical. I provided it
>> with administrative credentials.
>> 11. The WireGuard UI opened and the icon appeared in the system
>> notification area.
>> 12. I saw that WireGuard was missing my configured tunnel. It was also
>> still prompting me to update it, which was very surprising.
>> 13. I told WireGuard to run the update again.
>> 14. The UI closed as the update took effect, but this time it opened
>> back up on its own after the update finished, which is what usually
>> happens. I saw that the icon was present in the system notification
>> area as well.
>> 15. I saw that my tunnel configuration was back, but the tunnel was
>> deactivated.
>> 16. I activated the tunnel and everything was happy again.
>>
>> If the MSI system was supposed to rollback in the case of failure, it
>> failed to do so. Perhaps the MSI system thought the update succeeded
>> when it didn't? I found it odd that the MSI reported that it had
>> installed the product immediately after it reported that it had
>> failed.
>>
>> Here are the events from the Windows Application event log again for
>> convenience, taken at step 7, in order of occurrence:
>>
>> ----
>>
>> Error, Event 1013, MsiInstaller, 11/17/2020 8:41:49 AM
>>
>> Product: WireGuard -- Wintun error: Unable to remove existing driver:
>> The system cannot find the file specified. (Code 0x00000002)
>>
>> ----
>>
>> Error, Event 1013, MsiInstaller, 11/17/2020 8:41:49 AM
>>
>> Product: WireGuard -- Wintun error: Failed to uninstall driver: The
>> operation completed successfully. (Code 0x00000000)
>>
>> ----
>>
>> Info, Event 11708, MsiInstaller, 11/17/2020 8:41:49 AM
>>
>> Product: WireGuard -- Installation failed.
>>
>> ----
>>
>> Info, Event 1033, MsiInstaller, 11/17/2020 8:41:49 AM
>>
>> Windows Installer installed the product. Product Name: WireGuard.
>> Product Version: 0.2.1. Product Language: 1033. Manufacturer:
>> WireGuard LLC. Installation success or error status: 1603.
>>
>> ----
>
> Thanks. We've reproduced this, understand the race condition that led
> to it, and are working on a fix for 0.2.2. Turns out to be quite
> tricky MSI internals at play. Your detailed reports were extremely
> useful. I'll keep you posted when we have a fix confirmed.
>

Looks like no big hacks required. We can plow right through the error
and continue onward without penalty:

https://git.zx2c4.com/wireguard-windows/commit/?id=60caaba12d08eb4227b9af868fd428134bfe7dce
https://git.zx2c4.com/wireguard-windows/commit/?id=e70cabae68bd9f12d64b2b269bd80a8b617c338c

So, I think this issue here is resolved now. Hopefully we'll have
v0.2.2 out tomorrow.

Jason

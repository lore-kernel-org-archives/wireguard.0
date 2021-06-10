Return-Path: <SRS0=GgA3=LE=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1A39C48BD1
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 10 Jun 2021 22:54:22 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 133B2613E7
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 10 Jun 2021 22:54:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 133B2613E7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 940bed72;
	Thu, 10 Jun 2021 22:53:38 +0000 (UTC)
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com
 [2607:f8b0:4864:20::230])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 8071201f
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 10 Jun 2021 16:21:03 +0000 (UTC)
Received: by mail-oi1-x230.google.com with SMTP id v22so2713386oic.2
 for <wireguard@lists.zx2c4.com>; Thu, 10 Jun 2021 09:21:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=1NLfuLI7WbF0jKF+T3rYqJauNUOQniOP2Nr6WQh1pxk=;
 b=iRiBX2+JFUsDmDcdCHuFFm1LbBxY3Nr17Hi5VEykz2U+8nV1HJuUMdAqS50W+JlZYy
 efN0VM39CQnoGi7hBEDsUBVyYbpbUYgTCQSKOehUH7l3GYvh3Et8ufgp+0eLHjcHn3Md
 jU0QNi32db3PFPqYIZD7eoqLyLccMEEY6OweHToo9Cinj53AlHuXDbdu3T3L00pA3ICe
 eY+hwN8wN4S5h167+MmCGIljRYnzMYqDrktjNtZbW0+u8dxg1Y4aZhFzwXUDQL+O6zXq
 tu5Bd1O55TD+sfYozr2Im0xwVN408d9tXm7Ahsbv3JDa0sPqhEZicGHkLukMOlKedycb
 W2pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=1NLfuLI7WbF0jKF+T3rYqJauNUOQniOP2Nr6WQh1pxk=;
 b=i1TDJYptba4e3IMyWybsmRtR029yl8Vv4TS126WTGaVCAyAz9Z6DbgofVts338Hoqt
 0BhR2a26Vewq/3CMKUA2wBuKghXeB7xR0g9nmzvt5bFn4Eb3bCmIcb6NelccMzuU1FcV
 upNSuR8j9QRPfj3A9Leo1lm53iV46uN5CE/80QVZWnR8RI+7D6UQzQhBhj62sfNqLNCo
 XUwyMa42sDD69Mxf6jnmMoy8eRTCsv8o01T1jHbshma/1eQk1TmMMQ/1m6KEbSmxEax5
 XTsZvXMIRmhnvLaJnKMSav9qlxnWSwk9BIlGYUvOSM4gFEjAr6u7kjsCHGL3MudA1bOD
 ysww==
X-Gm-Message-State: AOAM530hPMD6ofbiGZHN6uqAzxAWw+ODU96AheLu7JutIZNMsBs4AQF/
 OtpC/47PcgOVFTWrXPnocZsrgs6b0zf9PzaVmyNar5G3LOMhrA==
X-Google-Smtp-Source: ABdhPJzTdK3CdDmmPA+4r1vs9sAayd0XV4SghQI1yryRy9ygOWhws+pIyTjjIaHpf32iCeBRRXkPzZPfYO5+9T8mhFQ=
X-Received: by 2002:aca:5bd4:: with SMTP id p203mr4016377oib.116.1623342061830; 
 Thu, 10 Jun 2021 09:21:01 -0700 (PDT)
MIME-Version: 1.0
From: Alex Sivchev <enn00th@gmail.com>
Date: Thu, 10 Jun 2021 19:20:51 +0300
Message-ID: <CAGb0AfPBZ2LACmXrgFKd_aeUHW-WMCty3f10tHyhQO19nOfO5Q@mail.gmail.com>
Subject: MSIs and WDAC
To: wireguard@lists.zx2c4.com
Content-Type: multipart/mixed; boundary="000000000000f1e38205c46bc690"
X-Mailman-Approved-At: Thu, 10 Jun 2021 22:53:37 +0000
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

--000000000000f1e38205c46bc690
Content-Type: text/plain; charset="UTF-8"

Hi,

The MSIs' customactions.dll is unsigned and therefore only Hash or
FileName rules [1] can be used to allow it in WDAC policies. Can it be
signed like the rest so that more reasonable and update-proof policies
could be created?

A patch is attached.

Regards,
Alex

[1] https://docs.microsoft.com/en-us/windows/security/threat-protection/windows-defender-application-control/select-types-of-rules-to-create#windows-defender-application-control-file-rule-levels

--000000000000f1e38205c46bc690
Content-Type: text/x-patch; charset="US-ASCII"; name="installer-build-sign.patch"
Content-Disposition: attachment; filename="installer-build-sign.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_kpr3nh080>
X-Attachment-Id: f_kpr3nh080

ZGlmZiAtLWdpdCBhL2luc3RhbGxlci9idWlsZC5iYXQgYi9pbnN0YWxsZXIvYnVpbGQuYmF0Cmlu
ZGV4IGM5ZGE5YzkxLi5kZmY5MDk3MiAxMDA2NDQKLS0tIGEvaW5zdGFsbGVyL2J1aWxkLmJhdAor
KysgYi9pbnN0YWxsZXIvYnVpbGQuYmF0CkBAIC00MCwxMSArNDAsNiBAQCBpZiBleGlzdCAuZGVw
c1xwcmVwYXJlZCBnb3RvIDpidWlsZAogCWNhbGwgOm1zaSBhbWQ2NCB4ODZfNjQgeDY0IHx8IGdv
dG8gOmVycm9yCiAJY2FsbCA6bXNpIGFybSBhcm12NyBhcm0gfHwgZ290byA6ZXJyb3IKIAljYWxs
IDptc2kgYXJtNjQgYWFyY2g2NCBhcm02NCB8fCBnb3RvIDplcnJvcgotCWlmIGV4aXN0IC4uXHNp
Z24uYmF0IGNhbGwgLi5cc2lnbi5iYXQKLQlpZiAiJVNpZ25pbmdDZXJ0aWZpY2F0ZSUiPT0iIiBn
b3RvIDpzdWNjZXNzCi0JaWYgIiVUaW1lc3RhbXBTZXJ2ZXIlIj09IiIgZ290byA6c3VjY2Vzcwot
CWVjaG8gWytdIFNpZ25pbmcKLQlzaWdudG9vbCBzaWduIC9zaGExICIlU2lnbmluZ0NlcnRpZmlj
YXRlJSIgL2ZkIHNoYTI1NiAvdHIgIiVUaW1lc3RhbXBTZXJ2ZXIlIiAvdGQgc2hhMjU2IC9kICJX
aXJlR3VhcmQgU2V0dXAiICJkaXN0XHdpcmVndWFyZC0qLSVXSVJFR1VBUkRfVkVSU0lPTiUubXNp
IiB8fCBnb3RvIDplcnJvcgogCiA6c3VjY2VzcwogCWVjaG8gWytdIFN1Y2Nlc3MuCkBAIC02Myw4
ICs1OCwxOCBAQCBpZiBleGlzdCAuZGVwc1xwcmVwYXJlZCBnb3RvIDpidWlsZAogCWVjaG8gWytd
IENvbXBpbGluZyAlMQogCSVDQyUgJUNGTEFHUyUgJUxERkxBR1MlIC1vICIlfjFcY3VzdG9tYWN0
aW9ucy5kbGwiIGN1c3RvbWFjdGlvbnMuYyAlTERMSUJTJSB8fCBleGl0IC9iIDEKIAkiJVdJWCVi
aW5cY2FuZGxlIiAlV0lYX0NBTkRMRV9GTEFHUyUgLWRXSVJFR1VBUkRfUExBVEZPUk09IiV+MSIg
LW91dCAiJX4xXHdpcmVndWFyZC53aXhvYmoiIC1hcmNoICUzIHdpcmVndWFyZC53eHMgfHwgZXhp
dCAvYiAlZXJyb3JsZXZlbCUKKwljYWxsIDpzaWduICV+MVxjdXN0b21hY3Rpb25zLmRsbCB8fCBn
b3RvIDplcnJvcgogCWVjaG8gWytdIExpbmtpbmcgJTEKIAkiJVdJWCViaW5cbGlnaHQiICVXSVhf
TElHSFRfRkxBR1MlIC1vdXQgImRpc3Rcd2lyZWd1YXJkLSV+MS0lV0lSRUdVQVJEX1ZFUlNJT04l
Lm1zaSIgIiV+MVx3aXJlZ3VhcmQud2l4b2JqIiB8fCBleGl0IC9iICVlcnJvcmxldmVsJQorCWNh
bGwgOnNpZ24gZGlzdFx3aXJlZ3VhcmQtJX4xLSVXSVJFR1VBUkRfVkVSU0lPTiUubXNpIHx8IGdv
dG8gOmVycm9yCisJZ290byA6ZW9mCisKKzpzaWduCisJaWYgZXhpc3QgLi5cc2lnbi5iYXQgY2Fs
bCAuLlxzaWduLmJhdAorCWlmICIlU2lnbmluZ0NlcnRpZmljYXRlJSI9PSIiIGdvdG8gOmVvZgor
CWlmICIlVGltZXN0YW1wU2VydmVyJSI9PSIiIGdvdG8gOmVvZgorCWVjaG8gWytdIFNpZ25pbmcg
JTEKKwlzaWdudG9vbCBzaWduIC9zaGExICIlU2lnbmluZ0NlcnRpZmljYXRlJSIgL2ZkIHNoYTI1
NiAvdHIgIiVUaW1lc3RhbXBTZXJ2ZXIlIiAvdGQgc2hhMjU2IC9kICJXaXJlR3VhcmQgU2V0dXAi
ICIlfjEiIHx8IGV4aXQgL2IgJWVycm9ybGV2ZWwlCiAJZ290byA6ZW9mCiAKIDplcnJvcgo=
--000000000000f1e38205c46bc690--

Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3FCCEF06E3
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  8 Feb 2026 17:13:17 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6422c224;
	Sun, 8 Feb 2026 17:10:14 +0000 (UTC)
Received: from outbound.ms.icloud.com
 (p-west3-cluster4-host1-snip4-2.eps.apple.com [57.103.74.173])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 7723fef6
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 30 Jun 2025 20:27:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=icloud.com;
 s=1a1hai; bh=IpiiKURuW77pswZJ9D2/Sa74iN4RfP9nuSseM32nLVE=;
 h=From:Content-Type:Mime-Version:Subject:Message-Id:Date:To:x-icloud-hme;
 b=wmb6SW37WC4FV/+eCznR9ry9249dmokRO+4O+dgdaizSNFrhIKyDHGj5OJNoTwUMZ
 YCN88ForCdgvZ2bl7Ra0kFiVT7qQJNIteGi+tQfSKx0gJ0iM5mUf9lGqRbPONDYaUW
 F/6Gujb0KJoULYfij9h42WVQ782FFVyuE5eQU7E1XyK0mj/uPFP8e16O9pEqSqs8QX
 IHjQ2wWx8E+qGfLtgd0oZApv+gDZb/EvzNsUR8lmpXkwRXn20C+FGETVjeObF8ANYD
 BwjOr/mKPZ/OrO9eWwpFshq26KWHQOdb0b6uKhZ3EVGjBCk7t/qCDAlukSC2PgG663
 7yycPEnscNvoQ==
Received: from outbound.ms.icloud.com (unknown [127.0.0.2])
 by outbound.ms.icloud.com (Postfix) with ESMTPS id A5FD61800494
 for <wireguard@lists.zx2c4.com>; Mon, 30 Jun 2025 20:27:06 +0000 (UTC)
Received: from
 p00-icloudmta-smtpin-us-west-3a-100-percent-13.p00-icloudmta-smtpin-vip.icloud-mail-production.svc.kube.us-west-3a.k8s.cloud.apple.com
 (ms-asmtpout-k8s.p00.prod.me.com [10.52.196.11])
 by outbound.ms.icloud.com (Postfix) with ESMTP id 5430C18004BA
 for <wireguard@lists.zx2c4.com>; Mon, 30 Jun 2025 20:27:06 +0000 (UTC)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com
 [209.85.167.50]) by
 p00-icloudmta-smtpin-us-west-3a-100-percent-13.p00-icloudmta-smtpin-vip.icloud-mail-production.svc.kube.us-west-3a.k8s.cloud.apple.com
 (Postfix) with ESMTPS id 9F0A6C000F5
 for <wireguard_at_lists_zx2c4_com_zp48d60a9st896_ae7p8716@icloud.com>;
 Mon, 30 Jun 2025 20:27:03 +0000 (UTC)
X-ICL-Info: GAtbRVYDBVFFSlVFSgQEUFUKE0oWX1gHVQoPB0UCBltbQVNZSQYBTEBJRhIcDV8iBxgNHgweXwxVHwJKClFdCwFXDxlYQlVfAhAUEh9FVxARJgcDJ1xfEQEKOQ0AAlVWKhoJGidKRlZNHVBHGQlFFk1AUCgZVQESTU5XQThZVQ4aDAJZG19bQh0cChhFXVcLGVQKEUkdUFdFVwEYF1daB1saCRpYQEIQSBQHHhQdWgREVABCSB5RDRoeChJWU1kPVR0CSgpRXQsBVw8ZWF1fBkhFXjNIAARSTUBLM0lxBE9BT1VFVXIEVzRUVjU8AwFWM0knNE4DdhAUEg8DVllYXA==
X-ICL-Score: 2.33303322422
X-ARC-Info: policy=fail; arc=none
X-DMARC-Policy: v=DMARC1; p=quarantine;
 rua=mailto:7e81dff3142a45b2862d789356bf0c1a@dmarc-reports.cloudflare.net
X-DMARC-Info: pass=pass; dmarc-policy=quarantine; s=r1; d=r1; pdomain=rakit.in
Received: by mail-lf1-f50.google.com with SMTP id
 2adb3069b0e04-55515213c3cso2152329e87.2
 for <wireguard_at_lists_zx2c4_com_zp48d60a9st896_ae7p8716@icloud.com>;
 Mon, 30 Jun 2025 13:27:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751315222; x=1751920022;
 h=to:date:message-id:subject:mime-version:content-transfer-encoding
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=IpiiKURuW77pswZJ9D2/Sa74iN4RfP9nuSseM32nLVE=;
 b=l72mxUZD7c7kme/hMcQ04BLstUyibJfnkBmi619PbfpUWVFF0rJwcC9yZQeYosD8jf
 l9y/t09i9lbag71W902ALyVb23swPZuGai/tLx8BdK2eVZwR8CKniltLUSuNSyb/jmEk
 7hGFvkf+ZRXZ5S17lTEu8zE1qHwVtdszRcoj56u1ds8MVXzFTULFD2Bj3Un1sLWltgx6
 HPhMEHCfwAul8KJ9gBWyZHekwUPPMZ9qY03Y91WaDV7eNubvrT1AOwvpSmsYnfxFn/3Y
 7C4fJWgBZrEgSAwBzeWG5AyEzD+Hiz4S7+O6MN+p7PpjC8v9zYxyVCzQm99LYUO+rmD1
 j76g==
X-Gm-Message-State: AOJu0YwQZUe/mnhPkMjyRxzsN8mFn7TeeUS5m84RYAGlla/241vasVN6
 gumYtZs9clPFZ0zljtWmjNl5haPvlFbOosBvVxPVTGMM25F7TGSWlpvatEi45f78wz1hbxGcx9G
 aqo/r
X-Gm-Gg: ASbGncvzxYtzS7W0fNGtdaS+TPkdr121hNqeIYMMXiOLgFeI/tXAdqpoNHAT/4qOhD+
 bRHFP7O8LfpkHyH2R1/P7x2EN5aGMEov57GWNeGyuz6rRaAG5bIDtrSrerlFLAnRwgPW3ezAn2M
 5pmFTK9DRU/EN1EpW2KWuMQDDf3mlaRFimqnsLOzaMksDmRymnEY+e5vfcIwFk99YpYh8ifryIA
 +gzNKtBH8DzzLQXoBu+6l2A2WbdF/7tDXQ2k9ohAgrQT4wRgKULZDVWQI78oH0dxBT9TAqrtBG1
 Ax2+/ep/ZV1D/v2YmIVBRhaHFyz6eAvyct8+iWLIvbGU
X-Google-Smtp-Source: AGHT+IEbBWG25k9x9xdIAbCE5CopIq3OrHCBDjRxPOsppHNcXZeA5Zb/bywNePsUiBzljGYlFMWtTA==
X-Received: by 2002:a05:6512:3b0e:b0:553:65bc:4231 with SMTP id
 2adb3069b0e04-5550b81ddc3mr4192979e87.21.1751315221850; 
 Mon, 30 Jun 2025 13:27:01 -0700 (PDT)
Received: from smtpclient.apple ([2a09:bac5:5154:2373::388:5c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5550b2b93adsm1543772e87.98.2025.06.30.13.27.01
 for <wireguard_at_lists_zx2c4_com_zp48d60a9st896_ae7p8716@icloud.com>
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 30 Jun 2025 13:27:01 -0700 (PDT)
From: grates_54_doyenne@icloud.com
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.600.51.1.1\))
Subject: [BUG] Specific IPv6 AllowedIPs Values Cause "Go Backend Library" error
Message-Id: <D379F7AD-9BFA-4028-9E2C-01EE0210C423@icloud.com>
Date: Mon, 30 Jun 2025 23:26:50 +0300
To: wireguard@lists.zx2c4.com
X-Mailer: Apple Mail (2.3826.600.51.1.1)
X-Proofpoint-GUID: tucmjyYLNlK821DKjZTstfgUPKhXccTG
X-Proofpoint-ORIG-GUID: tucmjyYLNlK821DKjZTstfgUPKhXccTG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjMwMDE2NyBTYWx0ZWRfX2yC90NLzo8ZW
 zcvQK9Q9QE3NrFux/ird9r/VQd1gkZGoTWXZfdDYm2uFBZyWyLur/KLa2/e7eBfdhrsW+HTP0oH
 BcPdm+zDVVYws/5xpLrdoA6u6F2O7UIImd/RXmww/lu/zlncaSne3kjDvCi4Wc5YtfoSuFMICAo
 Brg3ux9QnA6am1j+BRP7rAvBmhkBmVIkgQfcM0DiltnpmFTIet3NqUbnPU8KFwzRV4TDjPORix9
 asq71MvSn6v3oFG8WkfzWnRYaHz2eAnOtgCESnA/xCeK/CkjSxdY8JyGRTzkDVKW1yhe3Ae1A=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-30_04,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 bulkscore=0 suspectscore=0 mlxlogscore=999 malwarescore=0 phishscore=0
 spamscore=0 mlxscore=0 clxscore=1011 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.22.0-2506060001 definitions=main-2506300167
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

Hi folks,

I am writing to inquire about a potential bug.

Description:
Certain IPv6 ranges in the AllowedIPs field trigger the following error =
when activating a tunnel:
"Activation failure: Unable to turn on Go backend library.=E2=80=9D

The issue was first observed in the macOS WireGuard client and later =
reproduced on iOS.

Root Cause:
When the following IPv6 ranges are added to the config:
fe80:1::/32, fe80:2::/31, fe80:4::/30, fe80:8::/29, fe80:10::/28
The client silently modifies them upon saving, replacing them with:
fe80::%lo0/32, fe80::%gif0/31, fe80::%anpi0/30, fe80::%en1/29, =
fe80::%awdl0/28
The injected suffixes (%lo0, %en1, etc.) appear to be network interface =
names, which then cause the Go backend to fail during activation, I =
guess.

Steps to Reproduce:
    =E2=80=A2 Create a new tunnel in the macOS or iOS WireGuard client.
    =E2=80=A2 Add the following to AllowedIPs:
fe80:1::/32, fe80:2::/31, fe80:4::/30, fe80:8::/29, fe80:10::/28
    =E2=80=A2 Save and activate the tunnel =E2=86=92 Error occurs.
    =E2=80=A2 Reopen the config =E2=86=92 Observe the modified IPs.

Environment:
    =E2=80=A2 OS: macOS 15.5, iOS 18.5
    =E2=80=A2 WireGuard version: 1.0.16 (both clients)

Notes:
    =E2=80=A2 The issue appears specific to the GUI clients (macOS/iOS); =
CLI utilities were not tested.
    =E2=80=A2 The automatic substitution of fe80:X::/Y with =
fe80::%<interface>/Y suggests a parsing bug in the config sanitization =
logic.


Igor=
